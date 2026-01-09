/*

Staging level one stage views
PostgreSQL
snake_case naming

*/

-- =====================================================
-- v_stage_l1_categories
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_categories;

CREATE VIEW staging_l1.v_stage_l1_categories AS
SELECT
    category_id,
    category_name,
    description,
    picture
FROM northwind.categories;


-- =====================================================
-- v_stage_l1_customers
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_customers;

CREATE VIEW staging_l1.v_stage_l1_customers AS
SELECT
    customer_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country,
    phone,
    fax
FROM northwind.customers;


-- =====================================================
-- v_stage_l1_employees
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_employees;

CREATE VIEW staging_l1.v_stage_l1_employees AS
SELECT
    employee_id,
    last_name,
    first_name,
    title,
    title_of_courtesy,
    birth_date,
    hire_date,
    address,
    city,
    region,
    postal_code,
    country,
    home_phone,
    extension,
    photo,
    notes,
    reports_to,
    photo_path
FROM northwind.employees;


-- =====================================================
-- v_stage_l1_employee_territories
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_employee_territories;

CREATE VIEW staging_l1.v_stage_l1_employee_territories AS
SELECT
    employee_id,
    territory_id
FROM northwind.employee_territories;


-- =====================================================
-- v_stage_l1_order_details
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_order_details;

CREATE VIEW staging_l1.v_stage_l1_order_details AS
SELECT
    order_id,
    product_id,
    unit_price,
    quantity,
    discount
FROM northwind.order_details;


-- =====================================================
-- v_stage_l1_orders
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_orders;

CREATE VIEW staging_l1.v_stage_l1_orders AS
SELECT
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    ship_via,
    freight,
    ship_name,
    ship_address,
    ship_city,
    ship_region,
    ship_postal_code,
    ship_country
FROM northwind.orders;


-- =====================================================
-- v_stage_l1_products
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_products;

CREATE VIEW staging_l1.v_stage_l1_products AS
SELECT
    product_id,
    product_name,
    supplier_id,
    category_id,
    quantity_per_unit,
    unit_price,
    units_in_stock,
    units_on_order,
    reorder_level,
    discontinued
FROM northwind.products;


-- =====================================================
-- v_stage_l1_region
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_region;

CREATE VIEW staging_l1.v_stage_l1_region AS
SELECT
    region_id,
    region_description
FROM northwind.region;


-- =====================================================
-- v_stage_l1_shippers
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_shippers;

CREATE VIEW staging_l1.v_stage_l1_shippers AS
SELECT
    shipper_id,
    company_name,
    phone
FROM northwind.shippers;


-- =====================================================
-- v_stage_l1_suppliers
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_suppliers;

CREATE VIEW staging_l1.v_stage_l1_suppliers AS
SELECT
    supplier_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country,
    phone,
    fax,
    homepage
FROM northwind.suppliers;

-- =====================================================
-- v_stage_l1_territories
-- =====================================================
DROP VIEW IF EXISTS staging_l1.v_stage_l1_territories;

CREATE VIEW staging_l1.v_stage_l1_territories AS
SELECT
    territory_id,
    territory_description,
    region_id
FROM northwind.territories;
