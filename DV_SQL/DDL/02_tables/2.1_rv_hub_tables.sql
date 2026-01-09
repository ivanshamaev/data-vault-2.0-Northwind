/*

Raw Data Vault tables - Hubs
PostgreSQL
snake_case naming

*/

-- =====================================================
-- h_customer
-- =====================================================
DROP TABLE IF EXISTS rdv.h_customer;

CREATE TABLE rdv.h_customer (
    hk_h_customer       bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    customer_id         char(5),
    CONSTRAINT pk_h_customer PRIMARY KEY (hk_h_customer),
    CONSTRAINT uk_h_customer UNIQUE (customer_id)
);

-- =====================================================
-- h_customer_type
-- =====================================================
DROP TABLE IF EXISTS rdv.h_customer_type;

CREATE TABLE rdv.h_customer_type (
    hk_h_customer_type  bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    customer_type_id    char(10),
    CONSTRAINT pk_h_customer_type PRIMARY KEY (hk_h_customer_type),
    CONSTRAINT uk_h_customer_type UNIQUE (customer_type_id)
);

-- =====================================================
-- h_employee
-- =====================================================
DROP TABLE IF EXISTS rdv.h_employee;

CREATE TABLE rdv.h_employee (
    hk_h_employee       bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    employee_id         integer NOT NULL,
    CONSTRAINT pk_h_employee PRIMARY KEY (hk_h_employee),
    CONSTRAINT uk_h_employee UNIQUE (employee_id)
);

-- =====================================================
-- h_order
-- =====================================================
DROP TABLE IF EXISTS rdv.h_order;

CREATE TABLE rdv.h_order (
    hk_h_order          bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    order_id            integer NOT NULL,
    CONSTRAINT pk_h_order PRIMARY KEY (hk_h_order),
    CONSTRAINT uk_h_order UNIQUE (order_id)
);

-- =====================================================
-- h_product
-- =====================================================
DROP TABLE IF EXISTS rdv.h_product;

CREATE TABLE rdv.h_product (
    hk_h_product        bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    product_id          integer NOT NULL,
    CONSTRAINT pk_h_product PRIMARY KEY (hk_h_product),
    CONSTRAINT uk_h_product UNIQUE (product_id)
);

-- =====================================================
-- h_product_category
-- =====================================================
DROP TABLE IF EXISTS rdv.h_product_category;

CREATE TABLE rdv.h_product_category (
    hk_h_product_category   bytea NOT NULL,
    dv_load_datetime        timestamptz NOT NULL,
    dv_record_source        varchar(255) NOT NULL,
    category_id             integer NOT NULL,
    CONSTRAINT pk_h_product_category PRIMARY KEY (hk_h_product_category),
    CONSTRAINT uk_h_product_category UNIQUE (category_id)
);

-- =====================================================
-- h_region
-- =====================================================
DROP TABLE IF EXISTS rdv.h_region;

CREATE TABLE rdv.h_region (
    hk_h_region         bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    region_id           integer NOT NULL,
    CONSTRAINT pk_h_region PRIMARY KEY (hk_h_region),
    CONSTRAINT uk_h_region UNIQUE (region_id)
);

-- =====================================================
-- h_shipper
-- =====================================================
DROP TABLE IF EXISTS rdv.h_shipper;

CREATE TABLE rdv.h_shipper (
    hk_h_shipper        bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    shipper_id          integer NOT NULL,
    CONSTRAINT pk_h_shipper PRIMARY KEY (hk_h_shipper),
    CONSTRAINT uk_h_shipper UNIQUE (shipper_id)
);

-- =====================================================
-- h_supplier
-- =====================================================
DROP TABLE IF EXISTS rdv.h_supplier;

CREATE TABLE rdv.h_supplier (
    hk_h_supplier       bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    supplier_id         integer NOT NULL,
    CONSTRAINT pk_h_supplier PRIMARY KEY (hk_h_supplier),
    CONSTRAINT uk_h_supplier UNIQUE (supplier_id)
);

-- =====================================================
-- h_territory
-- =====================================================
DROP TABLE IF EXISTS rdv.h_territory;

CREATE TABLE rdv.h_territory (
    hk_h_territory      bytea NOT NULL,
    dv_load_datetime    timestamptz NOT NULL,
    dv_record_source    varchar(255) NOT NULL,
    territory_id        varchar(20) NOT NULL,
    CONSTRAINT pk_h_territory PRIMARY KEY (hk_h_territory),
    CONSTRAINT uk_h_territory UNIQUE (territory_id)
);
