/*

staging_l2 level two tables
PostgreSQL
snake_case naming

*/

-- =====================================================
-- l2_categories
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_categories;

CREATE TABLE staging_l2.l2_categories (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_product_category     bytea NOT NULL,
    hd_s_product_category_staging bytea NOT NULL,
    category_id               integer,
    category_name             varchar(15),
    description               text,
    picture                   bytea
);

-- =====================================================
-- l2_customers
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_customers;

CREATE TABLE staging_l2.l2_customers (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_customer             bytea NOT NULL,
    hd_s_customer_staging bytea NOT NULL,
    customer_id               char(5),
    company_name              varchar(40),
    contact_name              varchar(30),
    contact_title             varchar(30),
    address                   varchar(60),
    city                      varchar(15),
    region                    varchar(15),
    postal_code               varchar(10),
    country                   varchar(15),
    phone                     varchar(24),
    fax                       varchar(24)
);

-- =====================================================
-- l2_employees
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_employees;

CREATE TABLE staging_l2.l2_employees (
    dv_sequence_number           integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime             timestamptz NOT NULL,
    dv_record_source             varchar(255) NOT NULL,
    hk_h_employee                bytea NOT NULL,
    hk_h_employee_manager        bytea NOT NULL,
    hk_l_employee_reporting_line bytea NOT NULL,
    hd_s_employee_staging    bytea NOT NULL,
    employee_id                  integer,
    last_name                    varchar(20),
    first_name                   varchar(10),
    title                        varchar(30),
    title_of_courtesy            varchar(25),
    birth_date                   timestamp,
    hire_date                    timestamp,
    address                      varchar(60),
    city                         varchar(15),
    region                       varchar(15),
    postal_code                  varchar(10),
    country                      varchar(15),
    home_phone                   varchar(24),
    extension                    varchar(4),
    photo                        bytea,
    notes                        text,
    reports_to                   integer,
    photo_path                   varchar(255)
);

-- =====================================================
-- l2_employee_territories
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_employee_territories;

CREATE TABLE staging_l2.l2_employee_territories (
    dv_sequence_number     integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime       timestamptz NOT NULL,
    dv_record_source       varchar(255) NOT NULL,
    hk_h_employee          bytea NOT NULL,
    hk_h_territory         bytea NOT NULL,
    hk_l_employee_territory bytea NOT NULL,
    employee_id            integer,
    territory_id           varchar(20)
);

-- =====================================================
-- l2_order_details
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_order_details;

CREATE TABLE staging_l2.l2_order_details (
    dv_sequence_number          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime            timestamptz NOT NULL,
    dv_record_source            varchar(255) NOT NULL,
    hk_h_order                  bytea NOT NULL,
    hk_h_product                bytea NOT NULL,
    hk_l_order_detail           bytea NOT NULL,
    hd_s_l_order_detail_staging bytea NOT NULL,
    order_id                    integer,
    product_id                  integer,
    unit_price                  numeric(19,4),
    quantity                    smallint,
    discount                    real
);

-- =====================================================
-- l2_orders
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_orders;

CREATE TABLE staging_l2.l2_orders (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_order                bytea NOT NULL,
    hk_h_customer             bytea NOT NULL,
    hk_h_employee             bytea NOT NULL,
    hk_h_shipper              bytea NOT NULL,
    hk_l_order_header         bytea NOT NULL,
    hd_s_order_staging        bytea NOT NULL,
    order_id                  integer,
    customer_id               char(5),
    employee_id               integer,
    order_date                timestamp,
    required_date             timestamp,
    shipped_date              timestamp,
    ship_via                  integer,
    freight                   numeric(19,4),
    ship_name                 varchar(40),
    ship_address              varchar(60),
    ship_city                 varchar(15),
    ship_region               varchar(15),
    ship_postal_code          varchar(10),
    ship_country              varchar(15)
);

-- =====================================================
-- l2_products
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_products;

CREATE TABLE staging_l2.l2_products (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_product              bytea NOT NULL,
    hk_h_supplier             bytea NOT NULL,
    hk_h_product_category     bytea NOT NULL,
    hk_l_product_supplier     bytea NOT NULL,
    hk_l_product_category     bytea NOT NULL,
    hd_s_product_staging      bytea NOT NULL,
    product_id                integer,
    product_name              varchar(40),
    supplier_id               integer,
    category_id               integer,
    quantity_per_unit         varchar(20),
    unit_price                numeric(19,4),
    units_in_stock            smallint,
    units_on_order            smallint,
    reorder_level             smallint,
    discontinued              smallint
);

-- =====================================================
-- l2_region
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_region;

CREATE TABLE staging_l2.l2_region (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_region               bytea NOT NULL,
    hd_s_region_staging       bytea NOT NULL,
    region_id                 integer,
    region_description        char(50)
);

-- =====================================================
-- l2_shippers
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_shippers;

CREATE TABLE staging_l2.l2_shippers (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_shipper              bytea NOT NULL,
    hd_s_shipper_staging      bytea NOT NULL,
    shipper_id                integer,
    company_name              varchar(40),
    phone                     varchar(24)
);

-- =====================================================
-- l2_suppliers
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_suppliers;

CREATE TABLE staging_l2.l2_suppliers (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_supplier             bytea NOT NULL,
    hd_s_supplier_staging 	  bytea NOT NULL,
    supplier_id               integer,
    company_name              varchar(40),
    contact_name              varchar(30),
    contact_title             varchar(30),
    address                   varchar(60),
    city                      varchar(15),
    region                    varchar(15),
    postal_code               varchar(10),
    country                   varchar(15),
    phone                     varchar(24),
    fax                       varchar(24),
    homepage                  text
);

-- =====================================================
-- l2_territories
-- =====================================================
DROP TABLE IF EXISTS staging_l2.l2_territories;

CREATE TABLE staging_l2.l2_territories (
    dv_sequence_number        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dv_load_datetime          timestamptz NOT NULL,
    dv_record_source          varchar(255) NOT NULL,
    hk_h_territory            bytea NOT NULL,
    hk_h_region               bytea NOT NULL,
    hk_l_territory_region     bytea NOT NULL,
    hd_s_territory_staging    bytea NOT NULL,
    territory_id              varchar(20),
    territory_description     char(50),
    region_id                 integer
);
