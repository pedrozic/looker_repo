
view: pdt_table {

  parameter: table_select{
    type: unquoted

    allowed_value: {
      label: "Cargo"
      value: "_cargo"
    }

    allowed_value: {
      label: "Pulldown"
      value: "_pulldown"
    }
  }

  derived_table: {
    sql:
      {% if table_select._parameter_value == '_cargo' %}
          SELECT
            order_items.id  AS `order_items.id`,
            order_items.sale_price  AS `order_items.sale_price`,
            COUNT(*) AS `order_items.count`
          FROM demo_db.order_items  AS order_items
          GROUP BY
          1,
          2
          ORDER BY
          3 DESC
          LIMIT 10
      {% elsif table_select._parameter_value == '_pulldown' %}
          SELECT
              users.id  AS `users.id`,
              users.first_name  AS `users.first_name`,
              users.state  AS `users.state`
          FROM demo_db.users  AS users
          LIMIT 10
      {% endif %}
      ;;
  }


# Defining measures and dimensions of the table selected (in my case: "demo_db.order_items") by "_cargo" parameter

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

  # Defining measures and dimensions of the table selected (in my case: "demo_db.users") by "_pulldown" parameter

  dimension: users_id {
    type: number
    sql: ${TABLE}.`users.id` ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.`users.first_name` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }
}
