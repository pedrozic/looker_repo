# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_sluispedro.model.lkml"

view: liquid_test {
  derived_table: {
    explore_source: order_items_vijaya {
      column: rank { field: products.rank }
      column: count { field: products.count }
      column: category { field: products.category }
      column: test_liquid { field: products.test_liquid }
    }
  }
  dimension: rank {
    description: ""
    type: number
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: category {
    description: ""
  }
  dimension: test_liquid {
    description: ""
    type: number
  }
}
