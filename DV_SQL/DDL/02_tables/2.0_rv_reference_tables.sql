/*

Raw Data Vault reference tables
PostgreSQL
snake_case naming

*/

-- =====================================================
-- r_date
-- =====================================================
DROP TABLE IF EXISTS rdv.r_date;

CREATE TABLE rdv.r_date (
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(255) NOT NULL,
    date_key                integer NOT NULL,
    date_value              date NOT NULL,
    date_string             varchar(16) NOT NULL,
    start_datetime          timestamp NOT NULL,
    end_datetime            timestamp NOT NULL,
    day_of_month_number     integer NOT NULL,
    month_number            integer NOT NULL,
    month_name              varchar(16) NOT NULL,
    year_number             integer NOT NULL,
    day_of_week_number      integer NOT NULL,
    day_of_week_name        varchar(16) NOT NULL,
    quarter_number          integer NOT NULL,
    quarter_name            varchar(16) NOT NULL,
    CONSTRAINT pk_r_date PRIMARY KEY (date_key),
    CONSTRAINT uk_r_date UNIQUE (date_value)
);

-- =====================================================
-- r_time
-- =====================================================
DROP TABLE IF EXISTS rdv.r_time;

CREATE TABLE rdv.r_time (
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(255) NOT NULL,
    time_key                integer NOT NULL,
    time_value              time(0) NOT NULL,
    time_string             varchar(8) NOT NULL,
    hours_of_day            integer NOT NULL,
    minutes_of_hour         integer NOT NULL,
    seconds_of_minute       integer NOT NULL,
    CONSTRAINT pk_r_time PRIMARY KEY (time_key),
    CONSTRAINT uk_r_time UNIQUE (time_value)
);
