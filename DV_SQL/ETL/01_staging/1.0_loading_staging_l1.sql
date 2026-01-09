/*
	Staging level one
*/

-- l1_categories

BEGIN;

	TRUNCATE TABLE staging_l1.l1_categories;

	INSERT INTO staging_l1.l1_categories (
		category_id
		, category_name
		, description
		, picture
	)
	SELECT 
		category_id
		, category_name
		, description
		, picture
	FROM staging_l1.v_stage_l1_categories;

COMMIT;


-- l1_customers

BEGIN;

	TRUNCATE TABLE staging_l1.l1_customers;

	INSERT INTO staging_l1.l1_customers (
		customer_id
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
	select
		customer_id
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
	from
		staging_l1.v_stage_l1_customers;

COMMIT;




-- l1_employees

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_employees;

	INSERT INTO staging_l1.l1_employees (
		employee_id
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
	select
		employee_id
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
	from
		staging_l1.v_stage_l1_employees;
	
COMMIT;




-- l1_employee_territories

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_employee_territories;

	INSERT INTO staging_l1.l1_employee_territories (
		employee_id
		, territory_id
	)
	SELECT 
		employee_id
		, territory_id
	FROM staging_l1.v_stage_l1_employee_territories;
	
COMMIT;




-- l1_order_details

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_order_details;

	INSERT INTO staging_l1.l1_order_details (
		order_id
		, product_id
		, unit_price
		, quantity
		, discount	
	)
	SELECT 
		order_id
		, product_id
		, unit_price
		, quantity
		, discount
	FROM staging_l1.v_stage_l1_order_details;
	
COMMIT;




-- l1_orders

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_orders;

	INSERT INTO staging_l1.l1_orders (
		order_id
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
		order_id
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
	FROM staging_l1.v_stage_l1_orders;
	
COMMIT;




-- l1_products

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_products;

	INSERT INTO staging_l1.l1_products (
		product_id
		, product_name
		, supplier_id
		, category_id
		, quantity_per_unit
		, unit_price
		, units_in_stock
		, units_on_order
		, reorder_level
		, discontinued	
	)
	SELECT 
		product_id
		, product_name
		, supplier_id
		, category_id
		, quantity_per_unit
		, unit_price
		, units_in_stock
		, units_on_order
		, reorder_level
		, discontinued
	FROM staging_l1.v_stage_l1_products;
	
COMMIT;




-- l1_region

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_region;

	INSERT INTO staging_l1.l1_region (
		region_id
		, region_description
	)
	SELECT 
		region_id
		, region_description
	FROM staging_l1.v_stage_l1_region;
	
COMMIT;




-- l1_shippers

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_shippers;

	INSERT INTO staging_l1.l1_shippers (
		shipper_id
		, company_name
		, phone
	)
	SELECT 
		shipper_id
		, company_name
		, phone
	FROM staging_l1.v_stage_l1_shippers;
	
COMMIT;




-- l1_suppliers

BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_suppliers;

	INSERT INTO staging_l1.l1_suppliers (
		supplier_id
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
		supplier_id
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
	FROM staging_l1.v_stage_l1_suppliers;
	
COMMIT;

-- l1_territories
BEGIN;
	
	TRUNCATE TABLE staging_l1.l1_territories;

	INSERT INTO staging_l1.l1_territories (
		territory_id
		, territory_description
		, region_id
	)
	SELECT 
		territory_id
		, territory_description
		, region_id
	FROM staging_l1.v_stage_l1_territories;
	
COMMIT;
