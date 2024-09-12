
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          order_items.id  AS `order_items.id`,
          order_items.sale_price  AS `order_items.sale_price`,
          COUNT(*) AS `order_items.count`
      FROM demo_db.order_items  AS order_items
      GROUP BY
          1,
          2
      ORDER BY
          3 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_id {
    type: number
    sql: ${TABLE}.`order_items.id` ;;
  }

  dimension: order_items_sale_price {
    type: number
    sql: ${TABLE}.`order_items.sale_price` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  set: detail {
    fields: [
        order_items_id,
	order_items_sale_price,
	order_items_count
    ]
  }
}
