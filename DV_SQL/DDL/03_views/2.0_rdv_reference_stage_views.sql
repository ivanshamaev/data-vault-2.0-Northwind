/*
Raw Data Vault reference source views
PostgreSQL
snake_case
*/

-- =====================================================
-- v_stage_r_date
-- =====================================================
DROP VIEW IF EXISTS rdv.v_stage_r_date;

CREATE VIEW rdv.v_stage_r_date AS
WITH
-- -----------------------------------------------------
-- Parameters
-- -----------------------------------------------------
cte_parameters AS (
    SELECT
        DATE '1900-01-01' AS date_start,
        make_date(
            extract(year FROM timezone('utc', now()))::int + 100,
            12,
            31
        ) AS date_end
),

-- -----------------------------------------------------
-- Generate sequence of days
-- -----------------------------------------------------
cte_sequence AS (
    SELECT generate_series(
        0,
        (SELECT (date_end - date_start) FROM cte_parameters)
    ) AS sequence_number
),

-- -----------------------------------------------------
-- Generate dates
-- -----------------------------------------------------
cte_date AS (
    SELECT
        s.sequence_number + 1 AS sequence_number,
        (p.date_start + s.sequence_number) AS date_value
    FROM cte_sequence s
    CROSS JOIN cte_parameters p
),

-- -----------------------------------------------------
-- Calculate date attributes
-- -----------------------------------------------------
cte_columns AS (
    SELECT
        to_char(date_value, 'YYYYMMDD')::int AS date_key,
        date_value::date AS date,
        to_char(date_value, 'YYYY-MM-DD') AS date_string,
        date_value::timestamp AS start_datetime,
        extract(day FROM date_value)::int AS day_of_month_number,
        extract(month FROM date_value)::int AS month_number,
        to_char(date_value, 'Month')::varchar(16) AS month_name,
        extract(year FROM date_value)::int AS year_number,
        extract(isodow FROM date_value)::int AS day_of_week_number,
        to_char(date_value, 'Day')::varchar(16) AS day_of_week_name,
        extract(quarter FROM date_value)::int AS quarter_number,
        CASE extract(quarter FROM date_value)
            WHEN 1 THEN 'Quarter One'
            WHEN 2 THEN 'Quarter Two'
            WHEN 3 THEN 'Quarter Three'
            WHEN 4 THEN 'Quarter Four'
        END AS quarter_name
    FROM cte_date
),

-- -----------------------------------------------------
-- Calculate end datetime
-- -----------------------------------------------------
cte_end_date AS (
    SELECT
        date_key,
        date,
        date_string,
        start_datetime,
        lead(start_datetime - interval '1 microsecond', 1,
            (date + interval '23 hours 59 minutes 59.999999 seconds')
        ) OVER (ORDER BY start_datetime) AS end_datetime,
        day_of_month_number,
        month_number,
        month_name,
        year_number,
        day_of_week_number,
        day_of_week_name,
        quarter_number,
        quarter_name
    FROM cte_columns
)

-- -----------------------------------------------------
-- Final select (exclude existing records)
-- -----------------------------------------------------
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'SYSTEM' AS dv_record_source,
    date_key,
    date,
    date_string,
    start_datetime,
    end_datetime,
    day_of_month_number,
    month_number,
    trim(month_name) AS month_name,
    year_number,
    day_of_week_number,
    trim(day_of_week_name) AS day_of_week_name,
    quarter_number,
    quarter_name
FROM cte_end_date stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.r_date ref
    WHERE ref.date_key = stage.date_key
);



-- =====================================================
-- v_stage_r_time
-- =====================================================
DROP VIEW IF EXISTS rdv.v_stage_r_time;

CREATE VIEW rdv.v_stage_r_time AS
WITH
-- -----------------------------------------------------
-- Generate seconds of day
-- -----------------------------------------------------
cte_time AS (
    SELECT
        generate_series(0, 86399) AS sequence_number
),

-- -----------------------------------------------------
-- Calculate time attributes
-- -----------------------------------------------------
cte_columns AS (
    SELECT
        sequence_number + 1 AS time_key,
        (time '00:00:00' + (sequence_number || ' seconds')::interval)::time(0) AS time,
        to_char(
            (time '00:00:00' + (sequence_number || ' seconds')::interval),
            'HH24:MI:SS'
        ) AS time_string,
        extract(hour FROM time '00:00:00' + (sequence_number || ' seconds')::interval)::int AS hours_of_day,
        extract(minute FROM time '00:00:00' + (sequence_number || ' seconds')::interval)::int AS minutes_of_hour,
        extract(second FROM time '00:00:00' + (sequence_number || ' seconds')::interval)::int AS seconds_of_minute
    FROM cte_time
)

-- -----------------------------------------------------
-- Final select (exclude existing records)
-- -----------------------------------------------------
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'SYSTEM' AS dv_record_source,
    time_key,
    time,
    time_string,
    hours_of_day,
    minutes_of_hour,
    seconds_of_minute
FROM cte_columns stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.r_time ref
    WHERE ref.time_key = stage.time_key
);
