/*

Raw Data Vault link standard satellite tables
PostgreSQL
snake_case naming

*/

-- =====================================================
-- s_l_order_detail
-- =====================================================
DROP TABLE IF EXISTS rdv.s_l_order_detail;

CREATE TABLE rdv.s_l_order_detail (
    hk_l_order_detail              bytea NOT NULL,
    dv_load_datetime               timestamptz NOT NULL,
    dv_record_source               varchar(255) NOT NULL,
    hd_s_l_order_detail            bytea NOT NULL,
    unit_price                     numeric(19,4),
    quantity                       smallint,
    discount                       real,
    CONSTRAINT pk_s_l_order_detail
        PRIMARY KEY (hk_l_order_detail, dv_load_datetime)
);
