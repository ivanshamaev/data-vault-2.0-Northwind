/*
Raw data vault link standard satellite stage views
PostgreSQL
snake_case
*/

-- =====================================================
-- v_stage_s_l_order_detail__staging_l2_order_details
-- =====================================================

DROP VIEW IF EXISTS rdv.v_s_l_order_detail__staging_l2_order_details;

CREATE VIEW rdv.v_s_l_order_detail__staging_l2_order_details AS
SELECT DISTINCT
    stage.hk_l_order_detail,
    stage.dv_load_datetime,
    stage.dv_record_source,
    stage.hd_s_l_order_detail_staging,
    stage.unit_price,
    stage.quantity,
    stage.discount
FROM staging_l2.l2_order_details stage
LEFT JOIN rdv.s_l_order_detail sat1
    ON stage.hk_l_order_detail = sat1.hk_l_order_detail
   AND sat1.dv_load_datetime = (
        SELECT MAX(sat2.dv_load_datetime)
        FROM rdv.s_l_order_detail sat2
        WHERE sat2.hk_l_order_detail = sat1.hk_l_order_detail
   )
WHERE sat1.hk_l_order_detail IS NULL
   OR stage.hd_s_l_order_detail_staging <> sat1.hd_s_l_order_detail;
