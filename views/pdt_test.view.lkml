# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_sluispedro.model.lkml"

view: pdt_test {
  derived_table: {
    sql: SELECT
      id  AS `order_items.id`,
      order_items.sale_price  AS `order_items.sale_price`
    FROM demo_db.order_items  AS order_items
    LIMIT 20 ;;
  }
  dimension: id {
    type: number
    primary_key: yes
    sql:${TABLE}.order_items ;;
  }
  dimension: sale_price {
    type: number
    sql:${TABLE}.order_items ;;
  }
}
