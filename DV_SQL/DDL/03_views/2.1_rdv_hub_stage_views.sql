/*
Raw Data Vault hub stage views
PostgreSQL
snake_case
*/

-- =====================================================
-- H_CUSTOMER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_customer__staging_l2_customers;

CREATE VIEW rdv.v_h_customer__staging_l2_customers AS
SELECT DISTINCT
    hk_h_customer,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    customer_id
FROM staging_l2.l2_customers stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_customer hub
    WHERE hub.hk_h_customer = stage.hk_h_customer
);


DROP VIEW IF EXISTS rdv.v_h_customer__staging_l2_orders;

CREATE VIEW rdv.v_h_customer__staging_l2_orders AS
SELECT DISTINCT
    hk_h_customer,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    customer_id
FROM staging_l2.l2_orders stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_customer hub
    WHERE hub.hk_h_customer = stage.hk_h_customer
);

-- =====================================================
-- H_EMPLOYEE
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_employee__staging_l2_employees__employee_id;

CREATE VIEW rdv.v_h_employee__staging_l2_employees__employee_id AS
SELECT DISTINCT
    hk_h_employee,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    employee_id
FROM staging_l2.l2_employees stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_employee hub
    WHERE hub.hk_h_employee = stage.hk_h_employee
);


DROP VIEW IF EXISTS rdv.v_h_employee__staging_l2_employees__reports_to;

CREATE VIEW rdv.v_h_employee__staging_l2_employees__reports_to AS
SELECT DISTINCT
    hk_h_employee_manager AS hk_h_employee,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    reports_to AS employee_id
FROM staging_l2.l2_employees stage
WHERE reports_to IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM rdv.h_employee hub
    WHERE hub.hk_h_employee = stage.hk_h_employee_manager
);


DROP VIEW IF EXISTS rdv.v_h_employee__staging_l2_employee_territories;

CREATE VIEW rdv.v_h_employee__staging_l2_employee_territories AS
SELECT DISTINCT
    hk_h_employee,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    employee_id
FROM staging_l2.l2_employee_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_employee hub
    WHERE hub.hk_h_employee = stage.hk_h_employee
);


DROP VIEW IF EXISTS rdv.v_h_employee__staging_l2_orders;

CREATE VIEW rdv.v_h_employee__staging_l2_orders AS
SELECT DISTINCT
    hk_h_employee,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    employee_id
FROM staging_l2.l2_orders stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_employee hub
    WHERE hub.hk_h_employee = stage.hk_h_employee
);

-- =====================================================
-- H_ORDER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_order__staging_l2_order_details;

CREATE VIEW rdv.v_h_order__staging_l2_order_details AS
SELECT DISTINCT
    hk_h_order,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    order_id
FROM staging_l2.l2_order_details stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_order hub
    WHERE hub.hk_h_order = stage.hk_h_order
);


DROP VIEW IF EXISTS rdv.v_h_order__staging_l2_orders;

CREATE VIEW rdv.v_h_order__staging_l2_orders AS
SELECT DISTINCT
    hk_h_order,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    order_id
FROM staging_l2.l2_orders stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_order hub
    WHERE hub.hk_h_order = stage.hk_h_order
);

-- =====================================================
-- H_PRODUCT
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_product__staging_l2_order_details;

CREATE VIEW rdv.v_h_product__staging_l2_order_details AS
SELECT DISTINCT
    hk_h_product,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    product_id
FROM staging_l2.l2_order_details stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_product hub
    WHERE hub.hk_h_product = stage.hk_h_product
);


DROP VIEW IF EXISTS rdv.v_h_product__staging_l2_products;

CREATE VIEW rdv.v_h_product__staging_l2_products AS
SELECT DISTINCT
    hk_h_product,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    product_id
FROM staging_l2.l2_products stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_product hub
    WHERE hub.hk_h_product = stage.hk_h_product
);

-- =====================================================
-- H_PRODUCT_CATEGORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_product_category__staging_l2_categories;

CREATE VIEW rdv.v_h_product_category__staging_l2_categories AS
SELECT DISTINCT
    hk_h_product_category,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    category_id
FROM staging_l2.l2_categories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_product_category hub
    WHERE hub.hk_h_product_category = stage.hk_h_product_category
);


DROP VIEW IF EXISTS rdv.v_h_product_category__staging_l2_products;

CREATE VIEW rdv.v_h_product_category__staging_l2_products AS
SELECT DISTINCT
    hk_h_product_category,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    category_id
FROM staging_l2.l2_products stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_product_category hub
    WHERE hub.hk_h_product_category = stage.hk_h_product_category
);

-- =====================================================
-- H_REGION
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_region__staging_l2_region;

CREATE VIEW rdv.v_h_region__staging_l2_region AS
SELECT DISTINCT
    hk_h_region,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    region_id
FROM staging_l2.l2_region stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_region hub
    WHERE hub.hk_h_region = stage.hk_h_region
);


DROP VIEW IF EXISTS rdv.v_h_region__staging_l2_territories;

CREATE VIEW rdv.v_h_region__staging_l2_territories AS
SELECT DISTINCT
    hk_h_region,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    region_id
FROM staging_l2.l2_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_region hub
    WHERE hub.hk_h_region = stage.hk_h_region
);

-- =====================================================
-- H_SHIPPER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_shipper__staging_l2_orders;

CREATE VIEW rdv.v_h_shipper__staging_l2_orders AS
SELECT DISTINCT
    hk_h_shipper,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    ship_via AS shipper_id
FROM staging_l2.l2_orders stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_shipper hub
    WHERE hub.hk_h_shipper = stage.hk_h_shipper
);


DROP VIEW IF EXISTS rdv.v_h_shipper__staging_l2_shippers;

CREATE VIEW rdv.v_h_shipper__staging_l2_shippers AS
SELECT DISTINCT
    hk_h_shipper,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    shipper_id
FROM staging_l2.l2_shippers stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_shipper hub
    WHERE hub.hk_h_shipper = stage.hk_h_shipper
);

-- =====================================================
-- H_SUPPLIER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_supplier__staging_l2_products;

CREATE VIEW rdv.v_h_supplier__staging_l2_products AS
SELECT DISTINCT
    hk_h_supplier,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    supplier_id
FROM staging_l2.l2_products stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_supplier hub
    WHERE hub.hk_h_supplier = stage.hk_h_supplier
);


DROP VIEW IF EXISTS rdv.v_h_supplier__staging_l2_suppliers;

CREATE VIEW rdv.v_h_supplier__staging_l2_suppliers AS
SELECT DISTINCT
    hk_h_supplier,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    supplier_id
FROM staging_l2.l2_suppliers stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_supplier hub
    WHERE hub.hk_h_supplier = stage.hk_h_supplier
);

-- =====================================================
-- H_TERRITORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_h_territory__staging_l2_employee_territories;

CREATE VIEW rdv.v_h_territory__staging_l2_employee_territories AS
SELECT DISTINCT
    hk_h_territory,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    territory_id
FROM staging_l2.l2_employee_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_territory hub
    WHERE hub.hk_h_territory = stage.hk_h_territory
);


DROP VIEW IF EXISTS rdv.v_h_territory__staging_l2_territories;

CREATE VIEW rdv.v_h_territory__staging_l2_territories AS
SELECT DISTINCT
    hk_h_territory,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    territory_id
FROM staging_l2.l2_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.h_territory hub
    WHERE hub.hk_h_territory = stage.hk_h_territory
);
