# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_sluispedro.model.lkml"

view: pdt_test {
  derived_table: {
    explore_source: order_items {
      column: id {}
      column: sale_price {}
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: sale_price {
    description: ""
    type: number
  }
}
