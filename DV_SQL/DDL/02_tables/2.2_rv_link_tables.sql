/*

Raw Data Vault tables - Links
PostgreSQL
snake_case naming

*/

-- =====================================================
-- Schema
-- =====================================================
CREATE SCHEMA IF NOT EXISTS rv;

-- =====================================================
-- l_customer_type
-- =====================================================
DROP TABLE IF EXISTS rdv.l_customer_type;

CREATE TABLE rdv.l_customer_type (
    hk_l_customer_type   bytea NOT NULL,
    dv_load_datetime     timestamptz NOT NULL,
    dv_record_source     varchar(55) NOT NULL,
    hk_h_customer        bytea NOT NULL,
    hk_h_customer_type   bytea NOT NULL,
    CONSTRAINT pk_l_customer_type PRIMARY KEY (hk_l_customer_type)
);

-- =====================================================
-- l_employee_reporting_line
-- =====================================================
DROP TABLE IF EXISTS rdv.l_employee_reporting_line;

CREATE TABLE rdv.l_employee_reporting_line (
    hk_l_employee_reporting_line   bytea NOT NULL,
    dv_load_datetime               timestamptz NOT NULL,
    dv_record_source               varchar(55) NOT NULL,
    hk_h_employee_direct_report_dk bytea NOT NULL,
    hk_h_employee_manager          bytea NOT NULL,
    CONSTRAINT pk_l_employee_reporting_line PRIMARY KEY (hk_l_employee_reporting_line)
);

-- =====================================================
-- l_employee_territory
-- =====================================================
DROP TABLE IF EXISTS rdv.l_employee_territory;

CREATE TABLE rdv.l_employee_territory (
    hk_l_employee_territory   bytea NOT NULL,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(55) NOT NULL,
    hk_h_employee             bytea NOT NULL,
    hk_h_territory            bytea NOT NULL,
    CONSTRAINT pk_l_employee_territory PRIMARY KEY (hk_l_employee_territory)
);

-- =====================================================
-- l_order_detail
-- =====================================================
DROP TABLE IF EXISTS rdv.l_order_detail;

CREATE TABLE rdv.l_order_detail (
    hk_l_order_detail   bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(55) NOT NULL,
    hk_h_order          bytea NOT NULL,
    hk_h_product        bytea NOT NULL,
    CONSTRAINT pk_l_order_detail PRIMARY KEY (hk_l_order_detail)
);

-- =====================================================
-- l_order_header
-- =====================================================
DROP TABLE IF EXISTS rdv.l_order_header;

CREATE TABLE rdv.l_order_header (
    hk_l_order_header   bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(55) NOT NULL,
    hk_h_order_dk       bytea NOT NULL,
    hk_h_customer       bytea NOT NULL,
    hk_h_employee       bytea NOT NULL,
    hk_h_shipper        bytea NOT NULL,
    CONSTRAINT pk_l_order_header PRIMARY KEY (hk_l_order_header)
);

-- =====================================================
-- l_product_category
-- =====================================================
DROP TABLE IF EXISTS rdv.l_product_category;

CREATE TABLE rdv.l_product_category (
    hk_l_product_category   bytea NOT NULL,
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(55) NOT NULL,
    hk_h_product_dk         bytea NOT NULL,
    hk_h_product_category   bytea NOT NULL,
    CONSTRAINT pk_l_product_category PRIMARY KEY (hk_l_product_category)
);

-- =====================================================
-- l_product_supplier
-- =====================================================
DROP TABLE IF EXISTS rdv.l_product_supplier;

CREATE TABLE rdv.l_product_supplier (
    hk_l_product_supplier   bytea NOT NULL,
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(55) NOT NULL,
    hk_h_product_dk         bytea NOT NULL,
    hk_h_supplier           bytea NOT NULL,
    CONSTRAINT pk_l_product_supplier PRIMARY KEY (hk_l_product_supplier)
);

-- =====================================================
-- l_territory_region
-- =====================================================
DROP TABLE IF EXISTS rdv.l_territory_region;

CREATE TABLE rdv.l_territory_region (
    hk_l_territory_region   bytea NOT NULL,
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(55) NOT NULL,
    hk_h_territory_dk       bytea NOT NULL,
    hk_h_region             bytea NOT NULL,
    CONSTRAINT pk_l_territory_region PRIMARY KEY (hk_l_territory_region)
);
