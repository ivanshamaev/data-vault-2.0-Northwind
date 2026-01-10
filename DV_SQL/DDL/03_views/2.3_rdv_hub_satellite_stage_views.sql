/*
Raw Data Vault hub standard satellite stage views
PostgreSQL
snake_case
*/

-- =====================================================
-- S_H_CUSTOMER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_customer__staging_l2_customers;

CREATE VIEW rdv.v_s_h_customer__staging_l2_customers AS
SELECT DISTINCT
    stage.hk_h_customer,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_customer_staging,
    stage.company_name,
    stage.contact_name,
    stage.contact_title,
    stage.address,
    stage.city,
    stage.region,
    stage.postal_code,
    stage.country,
    stage.phone,
    stage.fax
FROM staging_l2.l2_customers stage
LEFT JOIN rdv.s_h_customer sat1
    ON stage.hk_h_customer = sat1.hk_h_customer
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_customer sat2
        WHERE sat2.hk_h_customer = sat1.hk_h_customer
   )
WHERE sat1.hk_h_customer IS NULL
   OR stage.hd_s_customer_staging <> sat1.hd_s_h_customer;

-- =====================================================
-- S_H_EMPLOYEE
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_employee__staging_l2_employees;

CREATE VIEW rdv.v_s_h_employee__staging_l2_employees AS
SELECT DISTINCT
    stage.hk_h_employee,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_employee_staging,
    stage.last_name,
    stage.first_name,
    stage.title,
    stage.title_of_courtesy,
    stage.birth_date,
    stage.hire_date,
    stage.address,
    stage.city,
    stage.region,
    stage.postal_code,
    stage.country,
    stage.home_phone,
    stage.extension,
    stage.photo,
    stage.notes,
    stage.photo_path
FROM staging_l2.l2_employees stage
LEFT JOIN rdv.s_h_employee sat1
    ON stage.hk_h_employee = sat1.hk_h_employee
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_employee sat2
        WHERE sat2.hk_h_employee = sat1.hk_h_employee
   )
WHERE sat1.hk_h_employee IS NULL
   OR stage.hd_s_employee_staging <> sat1.hd_s_h_employee;

-- =====================================================
-- S_H_ORDER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_order__staging_l2_orders;

CREATE VIEW rdv.v_s_h_order__staging_l2_orders AS
SELECT DISTINCT
    stage.hk_h_order,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_order_staging,
    stage.order_date,
    stage.required_date,
    stage.shipped_date,
    stage.freight,
    stage.ship_name,
    stage.ship_address,
    stage.ship_city,
    stage.ship_region,
    stage.ship_postal_code,
    stage.ship_country
FROM staging_l2.l2_orders stage
LEFT JOIN rdv.s_h_order sat1
    ON stage.hk_h_order = sat1.hk_h_order
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_order sat2
        WHERE sat2.hk_h_order = sat1.hk_h_order
   )
WHERE sat1.hk_h_order IS NULL
   OR stage.hd_s_order_staging <> sat1.hd_s_h_order;

-- =====================================================
-- S_H_PRODUCT_CATEGORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_product_category__staging_l2_categories;

CREATE VIEW rdv.v_s_h_product_category__staging_l2_categories AS
SELECT DISTINCT
    stage.hk_h_product_category,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_product_category_staging,
    stage.category_name,
    stage.description,
    stage.picture
FROM staging_l2.l2_categories stage
LEFT JOIN rdv.s_h_product_category sat1
    ON stage.hk_h_product_category = sat1.hk_h_product_category
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_product_category sat2
        WHERE sat2.hk_h_product_category = sat1.hk_h_product_category
   )
WHERE sat1.hk_h_product_category IS NULL
   OR stage.hd_s_product_category_staging <> sat1.hd_s_h_product_category;

-- =====================================================
-- S_H_PRODUCT
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_product__staging_l2_products;

CREATE VIEW rdv.v_s_h_product__staging_l2_products AS
SELECT DISTINCT
    stage.hk_h_product,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_product_staging,
    stage.product_name,
    stage.quantity_per_unit,
    stage.unit_price,
    stage.units_in_stock,
    stage.units_on_order,
    stage.reorder_level,
    stage.discontinued
FROM staging_l2.l2_products stage
LEFT JOIN rdv.s_h_product sat1
    ON stage.hk_h_product = sat1.hk_h_product
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_product sat2
        WHERE sat2.hk_h_product = sat1.hk_h_product
   )
WHERE sat1.hk_h_product IS NULL
   OR stage.hd_s_product_staging <> sat1.hd_s_h_product;

-- =====================================================
-- S_H_REGION
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_region__staging_l2_region;

CREATE VIEW rdv.v_s_h_region__staging_l2_region AS
SELECT DISTINCT
    stage.hk_h_region,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_region_staging,
    stage.region_description
FROM staging_l2.l2_region stage
LEFT JOIN rdv.s_h_region sat1
    ON stage.hk_h_region = sat1.hk_h_region
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_region sat2
        WHERE sat2.hk_h_region = sat1.hk_h_region
   )
WHERE sat1.hk_h_region IS NULL
   OR stage.hd_s_region_staging <> sat1.hd_s_h_region;

-- =====================================================
-- S_H_SHIPPER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_shipper__staging_l2_shippers;

CREATE VIEW rdv.v_s_h_shipper__staging_l2_shippers AS
SELECT DISTINCT
    stage.hk_h_shipper,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_shipper_staging,
    stage.company_name,
    stage.phone
FROM staging_l2.l2_shippers stage
LEFT JOIN rdv.s_h_shipper sat1
    ON stage.hk_h_shipper = sat1.hk_h_shipper
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_shipper sat2
        WHERE sat2.hk_h_shipper = sat1.hk_h_shipper
   )
WHERE sat1.hk_h_shipper IS NULL
   OR stage.hd_s_shipper_staging <> sat1.hd_s_h_shipper;

-- =====================================================
-- S_H_SUPPLIER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_supplier__staging_l2_suppliers;

CREATE VIEW rdv.v_s_h_supplier__staging_l2_suppliers AS
SELECT DISTINCT
    stage.hk_h_supplier,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_supplier_staging,
    stage.company_name,
    stage.contact_name,
    stage.contact_title,
    stage.address,
    stage.city,
    stage.region,
    stage.postal_code,
    stage.country,
    stage.phone,
    stage.fax,
    stage.homepage
FROM staging_l2.l2_suppliers stage
LEFT JOIN rdv.s_h_supplier sat1
    ON stage.hk_h_supplier = sat1.hk_h_supplier
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_supplier sat2
        WHERE sat2.hk_h_supplier = sat1.hk_h_supplier
   )
WHERE sat1.hk_h_supplier IS NULL
   OR stage.hd_s_supplier_staging <> sat1.hd_s_h_supplier;

-- =====================================================
-- S_H_TERRITORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_h_territory__staging_l2_territories;

CREATE VIEW rdv.v_s_h_territory__staging_l2_territories AS
SELECT DISTINCT
    stage.hk_h_territory,
    timezone('utc', now()) AS dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_territory_staging,
    stage.territory_description
FROM staging_l2.l2_territories stage
LEFT JOIN rdv.s_h_territory sat1
    ON stage.hk_h_territory = sat1.hk_h_territory
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_h_territory sat2
        WHERE sat2.hk_h_territory = sat1.hk_h_territory
   )
WHERE sat1.hk_h_territory IS NULL
   OR stage.hd_s_territory_staging <> sat1.hd_s_h_territory;
