/*
	
	Staging level two stored procedures

*/

-- l2_categories

BEGIN;

	TRUNCATE TABLE staging_l2.l2_categories;

	INSERT INTO staging_l2.l2_categories (
		dv_load_datetime
		, dv_record_source
		, hk_h_product_category
		, hd_s_product_category_staging
		, category_id
		, category_name
		, description
		, picture
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_product_category
		, hd_s_product_category_staging
		, category_id
		, category_name
		, description
		, picture
	FROM staging_l2.v_stage_l2_categories;

COMMIT;

-- l2_customers

BEGIN;

	TRUNCATE TABLE staging_l2.l2_customers;

	INSERT INTO staging_l2.l2_customers (
		dv_load_datetime
		, dv_record_source
		, hk_h_customer
		, hd_s_customer_staging
		, customer_id
		, company_name
		, contact_name
		, contact_title
		, address
		, city
		, region
		, postal_code
		, country
		, phone
		, fax
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_customer
		, hd_s_customer_staging
		, customer_id
		, company_name
		, contact_name
		, contact_title
		, address
		, city
		, region
		, postal_code
		, country
		, phone
		, fax
	FROM staging_l2.v_stage_l2_customers;

COMMIT;




-- l2_employees

BEGIN;

	TRUNCATE TABLE staging_l2.l2_employees;

	INSERT INTO staging_l2.l2_employees (
		dv_load_datetime
		, dv_record_source
		, hk_h_employee
		, hk_h_employee_manager
		, hk_l_employee_reporting_line
		, hd_s_employee_staging
		, employee_id
		, last_name
		, first_name
		, title
		, title_of_courtesy
		, birth_date
		, hire_date
		, address
		, city
		, region
		, postal_code
		, country
		, home_phone
		, "extension"
		, photo
		, notes
		, reports_to
		, photo_path
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_employee
		, hk_h_employee_manager
		, hk_l_employee_reporting_line
		, hd_s_employee_staging
		, employee_id
		, last_name
		, first_name
		, title
		, title_of_courtesy
		, birth_date
		, hire_date
		, address
		, city
		, region
		, postal_code
		, country
		, home_phone
		, "extension"
		, photo
		, notes
		, reports_to
		, photo_path
	FROM staging_l2.v_stage_l2_employees;

COMMIT;




-- l2_employee_territories

BEGIN;

	TRUNCATE TABLE staging_l2.l2_employee_territories;

	INSERT INTO staging_l2.l2_employee_territories (
		dv_load_datetime
		, dv_record_source
		, hk_h_employee
		, hk_h_territory
		, hk_l_employee_territory
		, employee_id
		, territory_id
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_employee
		, hk_h_territory
		, hk_l_employee_territory
		, employee_id
		, territory_id
	FROM staging_l2.v_stage_l2_employee_territories;

COMMIT;




-- l2_order_details

BEGIN;

	TRUNCATE TABLE staging_l2.l2_order_details;

	INSERT INTO staging_l2.l2_order_details (
		dv_load_datetime
		, dv_record_source
		, hk_h_order
		, hk_h_product
		, hk_l_order_detail
		, hd_s_l_order_detail_staging
		, order_id
		, product_id
		, unit_price
		, quantity
		, discount
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_order
		, hk_h_product
		, hk_l_order_detail
		, hd_s_l_order_detail_staging
		, order_id
		, product_id
		, unit_price
		, quantity
		, discount
	FROM staging_l2.v_stage_l2_order_details;

COMMIT;




-- l2_orders

BEGIN;

	TRUNCATE TABLE staging_l2.l2_orders;

	INSERT INTO staging_l2.l2_orders (
		dv_load_datetime
		, dv_record_source
		, hk_h_order
		, hk_h_customer
		, hk_h_employee
		, hk_h_shipper
		, hk_l_order_header
		, hd_s_order_staging
		, order_id
		, customer_id
		, employee_id
		, order_date
		, required_date
		, shipped_date
		, ship_via
		, freight
		, ship_name
		, ship_address
		, ship_city
		, ship_region
		, ship_postal_code
		, ship_country
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_order
		, hk_h_customer
		, hk_h_employee
		, hk_h_shipper
		, hk_l_order_header
		, hd_s_order_staging
		, order_id
		, customer_id
		, employee_id
		, order_date
		, required_date
		, shipped_date
		, ship_via
		, freight
		, ship_name
		, ship_address
		, ship_city
		, ship_region
		, ship_postal_code
		, ship_country
	FROM staging_l2.v_stage_l2_orders;

COMMIT;




-- l2_products

BEGIN;

	TRUNCATE TABLE staging_l2.l2_products;

	INSERT INTO staging_l2.l2_products (
		dv_load_datetime
		, dv_record_source
		, hk_h_product
		, hk_h_supplier
		, hk_h_product_category
		, hk_l_product_supplier
		, hk_l_product_category
		, hd_s_product_staging
		, product_id, product_name
		, supplier_id, category_id
		, quantity_per_unit
		, unit_price
		, units_in_stock
		, units_on_order
		, reorder_level
		, discontinued
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_product
		, hk_h_supplier
		, hk_h_product_category
		, hk_l_product_supplier
		, hk_l_product_category
		, hd_s_product_staging
		, product_id, product_name
		, supplier_id, category_id
		, quantity_per_unit
		, unit_price
		, units_in_stock
		, units_on_order
		, reorder_level
		, discontinued
	FROM staging_l2.v_stage_l2_products;

COMMIT;




-- l2_region

BEGIN;

	TRUNCATE TABLE staging_l2.l2_region;

	INSERT INTO staging_l2.l2_region (
		dv_load_datetime
		, dv_record_source
		, hk_h_region
		, hd_s_region_staging
		, region_id
		, region_description
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_region
		, hd_s_region_staging
		, region_id
		, region_description
	FROM staging_l2.v_stage_l2_region;

COMMIT;




-- l2_shippers

BEGIN;

	TRUNCATE TABLE staging_l2.l2_shippers;

	INSERT INTO staging_l2.l2_shippers (
		dv_load_datetime
		, dv_record_source
		, hk_h_shipper
		, hd_s_shipper_staging
		, shipper_id
		, company_name
		, phone
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_shipper
		, hd_s_shipper_staging
		, shipper_id
		, company_name
		, phone
	FROM staging_l2.v_stage_l2_shippers;

COMMIT;




-- l2_suppliers

BEGIN;

	TRUNCATE TABLE staging_l2.l2_suppliers;

	INSERT INTO staging_l2.l2_suppliers (
		dv_load_datetime
		, dv_record_source
		, hk_h_supplier
		, hd_s_supplier_staging
		, supplier_id
		, company_name
		, contact_name
		, contact_title
		, address
		, city
		, region
		, postal_code
		, country
		, phone
		, fax
		, homepage
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_supplier
		, hd_s_supplier_staging
		, supplier_id
		, company_name
		, contact_name
		, contact_title
		, address
		, city
		, region
		, postal_code
		, country
		, phone
		, fax
		, homepage
	FROM staging_l2.v_stage_l2_suppliers;

COMMIT;




-- l2_territories

BEGIN;

	TRUNCATE TABLE staging_l2.l2_territories;

	INSERT INTO staging_l2.l2_territories (
		dv_load_datetime
		, dv_record_source
		, hk_h_territory
		, hk_h_region
		, hk_l_territory_region
		, hd_s_territory_staging
		, territory_id
		, territory_description
		, region_id
	)
	SELECT 
		dv_load_datetime
		, dv_record_source
		, hk_h_territory
		, hk_h_region
		, hk_l_territory_region
		, hd_s_territory_staging
		, territory_id
		, territory_description
		, region_id
	FROM staging_l2.v_stage_l2_territories;

COMMIT;