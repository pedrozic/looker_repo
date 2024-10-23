view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: product_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
    link: {
      label: "label sample"
      url: "
      {% if value == 1522 %}
      /dashboards/71
      {% elsif value == 1496  %}
      /dashboards/63
      {% else  %}
      /dashboards/79
      {% endif %}"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
