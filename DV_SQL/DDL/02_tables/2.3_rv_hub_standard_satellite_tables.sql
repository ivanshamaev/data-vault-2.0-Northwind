/*

Raw Data Vault hub standard satellite tables
PostgreSQL
snake_case naming

*/

-- =====================================================
-- s_h_customer
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_customer;

CREATE TABLE rdv.s_h_customer (
    hk_h_customer            bytea NOT NULL,
    dv_load_datetime         timestamptz NOT NULL,
    dv_record_source         varchar(255) NOT NULL,
    hd_s_h_customer          bytea NOT NULL,
    company_name             varchar(40),
    contact_name             varchar(30),
    contact_title            varchar(30),
    address                  varchar(60),
    city                     varchar(15),
    region                   varchar(15),
    postal_code              varchar(10),
    country                  varchar(15),
    phone                    varchar(24),
    fax                      varchar(24),
    CONSTRAINT pk_s_h_customer
        PRIMARY KEY (hk_h_customer, dv_load_datetime)
);

-- =====================================================
-- s_h_customer_type
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_customer_type;

CREATE TABLE rdv.s_h_customer_type (
    hk_h_customer_type            bytea NOT NULL,
    dv_load_datetime              timestamptz NOT NULL,
    dv_record_source              varchar(255) NOT NULL,
    hd_s_h_customer_type          bytea NOT NULL,
    customer_desc                 text,
    CONSTRAINT pk_s_h_customer_type
        PRIMARY KEY (hk_h_customer_type, dv_load_datetime)
);

-- =====================================================
-- s_h_employee
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_employee;

CREATE TABLE rdv.s_h_employee (
    hk_h_employee             bytea NOT NULL,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hd_s_h_employee           bytea NOT NULL,
    last_name                 varchar(20),
    first_name                varchar(10),
    title                     varchar(30),
    title_of_courtesy          varchar(25),
    birth_date                timestamp,
    hire_date                 timestamp,
    address                   varchar(60),
    city                      varchar(15),
    region                    varchar(15),
    postal_code               varchar(10),
    country                   varchar(15),
    home_phone                varchar(24),
    extension                 varchar(4),
    photo                     bytea,
    notes                     text,
    photo_path                varchar(255),
    CONSTRAINT pk_s_h_employee
        PRIMARY KEY (hk_h_employee, dv_load_datetime)
);

-- =====================================================
-- s_h_order
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_order;

CREATE TABLE rdv.s_h_order (
    hk_h_order             bytea NOT NULL,
    dv_load_datetime       timestamptz NOT NULL,
    dv_record_source       varchar(255) NOT NULL,
    hd_s_h_order           bytea NOT NULL,
    order_date             timestamp,
    required_date          timestamp,
    shipped_date           timestamp,
    freight                numeric(19,4),
    ship_name              varchar(40),
    ship_address           varchar(60),
    ship_city              varchar(15),
    ship_region            varchar(15),
    ship_postal_code       varchar(10),
    ship_country           varchar(15),
    CONSTRAINT pk_s_h_order
        PRIMARY KEY (hk_h_order, dv_load_datetime)
);

-- =====================================================
-- s_h_product
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_product;

CREATE TABLE rdv.s_h_product (
    hk_h_product              bytea NOT NULL,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hd_s_h_product            bytea NOT NULL,
    product_name              varchar(40),
    quantity_per_unit         varchar(20),
    unit_price                numeric(19,4),
    units_in_stock            smallint,
    units_on_order            smallint,
    reorder_level             smallint,
    discontinued              boolean,
    CONSTRAINT pk_s_h_product
        PRIMARY KEY (hk_h_product, dv_load_datetime)
);

-- =====================================================
-- s_h_product_category
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_product_category;

CREATE TABLE rdv.s_h_product_category (
    hk_h_product_category             bytea NOT NULL,
    dv_load_datetime                  timestamptz NOT NULL,
    dv_record_source                  varchar(255) NOT NULL,
    hd_s_h_product_category           bytea NOT NULL,
    category_name                     varchar(15),
    description                       text,
    picture                           bytea,
    CONSTRAINT pk_s_h_product_category
        PRIMARY KEY (hk_h_product_category, dv_load_datetime)
);

-- =====================================================
-- s_h_region
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_region;

CREATE TABLE rdv.s_h_region (
    hk_h_region              bytea NOT NULL,
    dv_load_datetime         timestamptz NOT NULL,
    dv_record_source         varchar(255) NOT NULL,
    hd_s_h_region            bytea NOT NULL,
    region_description       char(50),
    CONSTRAINT pk_s_h_region
        PRIMARY KEY (hk_h_region, dv_load_datetime)
);

-- =====================================================
-- s_h_shipper
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_shipper;

CREATE TABLE rdv.s_h_shipper (
    hk_h_shipper              bytea NOT NULL,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hd_s_h_shipper            bytea NOT NULL,
    company_name              varchar(40),
    phone                     varchar(24),
    CONSTRAINT pk_s_h_shipper
        PRIMARY KEY (hk_h_shipper, dv_load_datetime)
);

-- =====================================================
-- s_h_supplier
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_supplier;

CREATE TABLE rdv.s_h_supplier (
    hk_h_supplier              bytea NOT NULL,
    dv_load_datetime           timestamptz NOT NULL,
    dv_record_source           varchar(255) NOT NULL,
    hd_s_h_supplier            bytea NOT NULL,
    company_name               varchar(40),
    contact_name               varchar(30),
    contact_title              varchar(30),
    address                    varchar(60),
    city                       varchar(15),
    region                     varchar(15),
    postal_code                varchar(10),
    country                    varchar(15),
    phone                      varchar(24),
    fax                        varchar(24),
    homepage                  text,
    CONSTRAINT pk_s_h_supplier
        PRIMARY KEY (hk_h_supplier, dv_load_datetime)
);

-- =====================================================
-- s_h_territory
-- =====================================================
DROP TABLE IF EXISTS rdv.s_h_territory;

CREATE TABLE rdv.s_h_territory (
    hk_h_territory              bytea NOT NULL,
    dv_load_datetime            timestamptz NOT NULL,
    dv_record_source            varchar(255) NOT NULL,
    hd_s_h_territory            bytea NOT NULL,
    territory_description       char(50),
    CONSTRAINT pk_s_h_territory
        PRIMARY KEY (hk_h_territory, dv_load_datetime)
);
