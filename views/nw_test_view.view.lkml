view: nw_test_view {
  sql_table_name: looker-private-demo.ecomm.order_items ;;


  dimension: id {
    label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    value_format: "00000"
  }

  dimension: inventory_item_id {
    label: "Inventory Item ID"
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

 }
