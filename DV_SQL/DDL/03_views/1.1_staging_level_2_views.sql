/*
Staging level two stage views
PostgreSQL
snake_case
*/

-- =====================================================
-- Categories
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_categories;

CREATE VIEW staging_l2.v_stage_l2_categories AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.categories' AS dv_record_source,
    digest(upper(trim(coalesce(category_id::text, '-1'))), 'sha256') AS hk_h_product_category,
    digest(
        concat_ws('|',
            trim(coalesce(category_name, '')),
            trim(coalesce(description, '')),
            trim(coalesce(encode(picture, 'hex'), ''))
        ),
        'sha256'
    ) AS hd_s_product_category_staging,
    coalesce(category_id, -1) AS category_id,
    category_name,
    description,
    picture
FROM staging_l1.l1_categories;

-- =====================================================
-- Customers
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_customers;

CREATE VIEW staging_l2.v_stage_l2_customers AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.customers' AS dv_record_source,
    digest(upper(trim(coalesce(customer_id, '-1'))), 'sha256') AS hk_h_customer,
    digest(
        concat_ws('|',
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
        ),
        'sha256'
    ) AS hd_s_customer_staging,
    coalesce(customer_id, '-1') AS customer_id,
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
FROM staging_l1.l1_customers;

-- =====================================================
-- Employees
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_employees;

CREATE VIEW staging_l2.v_stage_l2_employees AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.employees' AS dv_record_source,
    digest(upper(trim(coalesce(employee_id::text, '-1'))), 'sha256') AS hk_h_employee,
    digest(upper(trim(coalesce(reports_to::text, '-2'))), 'sha256') AS hk_h_employee_manager,
    digest(
        upper(concat_ws('|',
            coalesce(employee_id::text, '-1'),
            coalesce(reports_to::text, '-2')
        )),
        'sha256'
    ) AS hk_l_employee_reporting_line,
    digest(
        concat_ws('|',
            last_name,
            first_name,
            title,
            title_of_courtesy,
            birth_date::text,
            hire_date::text,
            address,
            city,
            region,
            postal_code,
            country,
            home_phone,
            extension,
            encode(photo, 'hex'),
            notes,
            photo_path
        ),
        'sha256'
    ) AS hd_s_employee_staging,
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
    coalesce(reports_to, -2) AS reports_to,
    photo_path
FROM staging_l1.l1_employees;

-- =====================================================
-- EmployeeTerritories
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_employee_territories;

CREATE VIEW staging_l2.v_stage_l2_employee_territories AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.employeeterritories' AS dv_record_source,
    digest(upper(trim(coalesce(employee_id::text, '-1'))), 'sha256') AS hk_h_employee,
    digest(upper(trim(coalesce(territory_id, '-1'))), 'sha256') AS hk_h_territory,
    digest(
        upper(concat_ws('|',
            coalesce(employee_id::text, '-1'),
            coalesce(territory_id, '-1')
        )),
        'sha256'
    ) AS hk_l_employee_territory,
    coalesce(employee_id, -1) AS employee_id,
    coalesce(territory_id, '-1') AS territory_id
FROM staging_l1.l1_employee_territories;

-- =====================================================
-- Order Details
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_order_details;

CREATE VIEW staging_l2.v_stage_l2_order_details AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.order_details' AS dv_record_source,
    digest(upper(trim(coalesce(order_id::text, '-1'))), 'sha256') AS hk_h_order,
    digest(upper(trim(coalesce(product_id::text, '-1'))), 'sha256') AS hk_h_product,
    digest(
        upper(concat_ws('|',
            coalesce(order_id::text, '-1'),
            coalesce(product_id::text, '-1')
        )),
        'sha256'
    ) AS hk_l_order_detail,
    digest(
        concat_ws('|',
            unit_price::text,
            quantity::text,
            discount::text
        ),
        'sha256'
    ) AS hd_s_l_order_detail_staging,
    coalesce(order_id, -1) AS order_id,
    coalesce(product_id, -1) AS product_id,
    unit_price,
    quantity,
    discount
FROM staging_l1.l1_order_details;

-- =====================================================
-- Orders
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_orders;

CREATE VIEW staging_l2.v_stage_l2_orders AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.orders' AS dv_record_source,
    digest(upper(trim(coalesce(order_id::text, '-1'))), 'sha256') AS hk_h_order,
    digest(upper(trim(coalesce(customer_id, '-1'))), 'sha256') AS hk_h_customer,
    digest(upper(trim(coalesce(employee_id::text, '-1'))), 'sha256') AS hk_h_employee,
    digest(upper(trim(coalesce(ship_via::text, '-1'))), 'sha256') AS hk_h_shipper,
    digest(
        upper(concat_ws('|',
            coalesce(order_id::text, '-1'),
            coalesce(customer_id, '-1'),
            coalesce(employee_id::text, '-1'),
            coalesce(ship_via::text, '-1')
        )),
        'sha256'
    ) AS hk_l_order_header,
    digest(
        concat_ws('|',
            order_date::text,
            required_date::text,
            shipped_date::text,
            freight::text,
            ship_name,
            ship_address,
            ship_city,
            ship_region,
            ship_postal_code,
            ship_country
        ),
        'sha256'
    ) AS hd_s_order_staging,
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
FROM staging_l1.l1_orders;

-- =====================================================
-- Products
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_products;

CREATE VIEW staging_l2.v_stage_l2_products AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.products' AS dv_record_source,
    digest(upper(trim(coalesce(product_id::text, '-1'))), 'sha256') AS hk_h_product,
    digest(upper(trim(coalesce(supplier_id::text, '-1'))), 'sha256') AS hk_h_supplier,
    digest(upper(trim(coalesce(category_id::text, '-1'))), 'sha256') AS hk_h_product_category,
    digest(
        upper(concat_ws('|',
            coalesce(product_id::text, '-1'),
            coalesce(supplier_id::text, '-1')
        )),
        'sha256'
    ) AS hk_l_product_supplier,
    digest(
        upper(concat_ws('|',
            coalesce(product_id::text, '-1'),
            coalesce(category_id::text, '-1')
        )),
        'sha256'
    ) AS hk_l_product_category,
    digest(
        concat_ws('|',
            product_name,
            quantity_per_unit,
            unit_price::text,
            units_in_stock::text,
            units_on_order::text,
            reorder_level::text,
            discontinued::text
        ),
        'sha256'
    ) AS hd_s_product_staging,
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
FROM staging_l1.l1_products;

-- =====================================================
-- Region
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_region;

CREATE VIEW staging_l2.v_stage_l2_region AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.region' AS dv_record_source,
    digest(upper(trim(coalesce(region_id::text, '-1'))), 'sha256') AS hk_h_region,
    digest(trim(coalesce(region_description, '')), 'sha256') AS hd_s_region_staging,
    region_id,
    region_description
FROM staging_l1.l1_region;

-- =====================================================
-- Shippers
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_shippers;

CREATE VIEW staging_l2.v_stage_l2_shippers AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.shippers' AS dv_record_source,
    digest(upper(trim(coalesce(shipper_id::text, '-1'))), 'sha256') AS hk_h_shipper,
    digest(concat_ws('|', company_name, phone), 'sha256') AS hd_s_shipper_staging,
    shipper_id,
    company_name,
    phone
FROM staging_l1.l1_shippers;

-- =====================================================
-- Suppliers
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_suppliers;

CREATE VIEW staging_l2.v_stage_l2_suppliers AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.suppliers' AS dv_record_source,
    digest(upper(trim(coalesce(supplier_id::text, '-1'))), 'sha256') AS hk_h_supplier,
    digest(
        concat_ws('|',
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
        ),
        'sha256'
    ) AS hd_s_supplier_staging,
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
FROM staging_l1.l1_suppliers;

-- =====================================================
-- Territories
-- =====================================================
DROP VIEW IF EXISTS staging_l2.v_stage_l2_territories;

CREATE VIEW staging_l2.v_stage_l2_territories AS
SELECT
    timezone('utc', now()) AS dv_load_datetime,
    'northwind.territories' AS dv_record_source,
    digest(upper(trim(coalesce(territory_id, '-1'))), 'sha256') AS hk_h_territory,
    digest(upper(trim(coalesce(region_id::text, '-1'))), 'sha256') AS hk_h_region,
    digest(
        upper(concat_ws('|',
            coalesce(territory_id, '-1'),
            coalesce(region_id::text, '-1')
        )),
        'sha256'
    ) AS hk_l_territory_region,
    digest(trim(coalesce(territory_description, '')), 'sha256') AS hd_s_territory_staging,
    territory_id,
    territory_description,
    region_id
FROM staging_l1.l1_territories;
