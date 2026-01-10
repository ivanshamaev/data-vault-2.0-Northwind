/*
Raw Data Vault link stage views
PostgreSQL
snake_case
*/

-- =====================================================
-- L_EMPLOYEE_REPORTING_LINE
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_employee_reporting_line__staging_l2_employees;

CREATE VIEW rdv.v_l_employee_reporting_line__staging_l2_employees AS
SELECT DISTINCT
    hk_l_employee_reporting_line,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_employee              AS hk_h_employee__direct_report__dk,
    hk_h_employee_manager
FROM staging_l2.l2_employees stage
WHERE hk_h_employee_manager IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM rdv.l_employee_reporting_line link
    WHERE link.hk_l_employee_reporting_line = stage.hk_l_employee_reporting_line
);

-- =====================================================
-- L_EMPLOYEE_TERRITORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_employee_territory__staging_l2_employee_territories;

CREATE VIEW rdv.v_l_employee_territory__staging_l2_employee_territories AS
SELECT DISTINCT
    hk_l_employee_territory,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_employee,
    hk_h_territory
FROM staging_l2.l2_employee_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_employee_territory link
    WHERE link.hk_l_employee_territory = stage.hk_l_employee_territory
);

-- =====================================================
-- L_ORDER_DETAIL
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_order_detail__staging_l2_order_details;

CREATE VIEW rdv.v_l_order_detail__staging_l2_order_details AS
SELECT DISTINCT
    hk_l_order_detail,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_order,
    hk_h_product
FROM staging_l2.l2_order_details stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_order_detail link
    WHERE link.hk_l_order_detail = stage.hk_l_order_detail
);

-- =====================================================
-- L_ORDER_HEADER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_order_header__staging_l2_orders;

CREATE VIEW rdv.v_l_order_header__staging_l2_orders AS
SELECT DISTINCT
    hk_l_order_header,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_order    AS hk_h_order__dk,
    hk_h_customer,
    hk_h_employee,
    hk_h_shipper
FROM staging_l2.l2_orders stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_order_header link
    WHERE link.hk_l_order_header = stage.hk_l_order_header
);

-- =====================================================
-- L_PRODUCT_CATEGORY
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_product_category__staging_l2_products;

CREATE VIEW rdv.v_l_product_category__staging_l2_products AS
SELECT DISTINCT
    hk_l_product_category,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_product          AS hk_h_product__dk,
    hk_h_product_category
FROM staging_l2.l2_products stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_product_category link
    WHERE link.hk_l_product_category = stage.hk_l_product_category
);

-- =====================================================
-- L_PRODUCT_SUPPLIER
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_product_supplier__staging_l2_products;

CREATE VIEW rdv.v_l_product_supplier__staging_l2_products AS
SELECT DISTINCT
    hk_l_product_supplier,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_product   AS hk_h_product__dk,
    hk_h_supplier
FROM staging_l2.l2_products stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_product_supplier link
    WHERE link.hk_l_product_supplier = stage.hk_l_product_supplier
);

-- =====================================================
-- L_TERRITORY_REGION
-- =====================================================

DROP VIEW IF EXISTS rdv.v_l_territory_region__staging_l2_territories;

CREATE VIEW rdv.v_l_territory_region__staging_l2_territories AS
SELECT DISTINCT
    hk_l_territory_region,
    timezone('utc', now()) AS dv_load_datetime,
    dv_record_source,
    hk_h_territory AS hk_h_territory__dk,
    hk_h_region
FROM staging_l2.l2_territories stage
WHERE NOT EXISTS (
    SELECT 1
    FROM rdv.l_territory_region link
    WHERE link.hk_l_territory_region = stage.hk_l_territory_region
);
