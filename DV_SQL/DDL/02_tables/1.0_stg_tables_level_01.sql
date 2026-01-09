/*

staging_l1 level one tables
PostgreSQL
snake_case naming

*/

-- =====================================================
-- l1_categories
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_categories;

CREATE TABLE staging_l1.l1_categories (
    category_id     integer,
    category_name   varchar(15),
    description     text,
    picture         bytea
);

-- =====================================================
-- l1_customers
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_customers;

CREATE TABLE staging_l1.l1_customers (
    customer_id    char(5),
    company_name   varchar(40),
    contact_name   varchar(30),
    contact_title  varchar(30),
    address        varchar(60),
    city           varchar(15),
    region         varchar(15),
    postal_code    varchar(10),
    country        varchar(15),
    phone          varchar(24),
    fax            varchar(24)
);

-- =====================================================
-- l1_employees
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_employees;

CREATE TABLE staging_l1.l1_employees (
    employee_id         integer,
    last_name           varchar(20),
    first_name          varchar(10),
    title               varchar(30),
    title_of_courtesy   varchar(25),
    birth_date          timestamp,
    hire_date           timestamp,
    address             varchar(60),
    city                varchar(15),
    region              varchar(15),
    postal_code         varchar(10),
    country             varchar(15),
    home_phone          varchar(24),
    extension           varchar(4),
    photo               bytea,
    notes               text,
    reports_to          integer,
    photo_path          varchar(255)
);

-- =====================================================
-- l1_employee_territories
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_employee_territories;

CREATE TABLE staging_l1.l1_employee_territories (
    employee_id   integer,
    territory_id  varchar(20)
);

-- =====================================================
-- l1_order_details
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_order_details;

CREATE TABLE staging_l1.l1_order_details (
    order_id     integer,
    product_id   integer,
    unit_price   numeric(19,4),
    quantity     smallint,
    discount     real
);

-- =====================================================
-- l1_orders
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_orders;

CREATE TABLE staging_l1.l1_orders (
    order_id            integer,
    customer_id         char(5),
    employee_id         integer,
    order_date          timestamp,
    required_date       timestamp,
    shipped_date        timestamp,
    ship_via            integer,
    freight             numeric(19,4),
    ship_name            varchar(40),
    ship_address         varchar(60),
    ship_city            varchar(15),
    ship_region          varchar(15),
    ship_postal_code     varchar(10),
    ship_country         varchar(15)
);

-- =====================================================
-- l1_products
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_products;

CREATE TABLE staging_l1.l1_products (
    product_id         integer,
    product_name       varchar(40),
    supplier_id        integer,
    category_id        integer,
    quantity_per_unit  varchar(20),
    unit_price         numeric(19,4),
    units_in_stock     smallint,
    units_on_order     smallint,
    reorder_level      smallint,
    discontinued       smallint
);

-- =====================================================
-- l1_region
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_region;

CREATE TABLE staging_l1.l1_region (
    region_id            integer,
    region_description   char(50)
);

-- =====================================================
-- l1_shippers
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_shippers;

CREATE TABLE staging_l1.l1_shippers (
    shipper_id    integer,
    company_name  varchar(40),
    phone         varchar(24)
);

-- =====================================================
-- l1_suppliers
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_suppliers;

CREATE TABLE staging_l1.l1_suppliers (
    supplier_id    integer,
    company_name   varchar(40),
    contact_name   varchar(30),
    contact_title  varchar(30),
    address        varchar(60),
    city           varchar(15),
    region         varchar(15),
    postal_code    varchar(10),
    country        varchar(15),
    phone          varchar(24),
    fax            varchar(24),
    homepage       text
);

-- =====================================================
-- l1_territories
-- =====================================================
DROP TABLE IF EXISTS staging_l1.l1_territories;

CREATE TABLE staging_l1.l1_territories (
    territory_id            varchar(20),
    territory_description   char(50),
    region_id               integer
);
