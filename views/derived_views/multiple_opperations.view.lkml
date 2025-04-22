view: multiple_opperations {

    derived_table: {
      explore_source: order_items {
        column: created_date {}
        column: average_sale_price {}
        column: total_sale_price {}
        column: average_days_to_process {}
        column: average_shipping_time {}
        column: count {}
        column: median_sale_price {}
        column: return_rate {}
        column: returned_count {}
        column: returned_total_sale_price {}
      }
    }





  parameter: operation_1 {
    type: unquoted
    allowed_value: { value: "Add" }
    allowed_value: { value: "Subtract" }
    allowed_value: { value: "Multiply" }
    allowed_value: { value: "Divide" }
    # default_value: "Month"
  }


  parameter: measure_1 {
    type: unquoted
    allowed_value: {label: "Average Sale Price" value: "average_sale_price" }
    allowed_value: {label: "Total Sale Price" value: "total_sale_price" }
    allowed_value: {label: "Average Days to Process" value: "average_days_to_process" }
    allowed_value: {label: "Average Shipping Time" value: "average_shipping_time" }
    allowed_value: {label: "Count" value: "count" }
    allowed_value: {label: "Median Sale Price" value: "median_sale_price" }
    allowed_value: {label: "Return Rate" value: "return_rate" }
    allowed_value: {label: "Returned Count" value: "returned_count" }
    allowed_value: {label: "Returned Total Sale Price" value: "returned_total_sale_price" }
  }


  parameter: measure_2 {
    type: unquoted
    allowed_value: {label: "Average Sale Price" value: "average_sale_price" }
    allowed_value: {label: "Total Sale Price" value: "total_sale_price" }
    allowed_value: {label: "Average Days to Process" value: "average_days_to_process" }
    allowed_value: {label: "Average Shipping Time" value: "average_shipping_time" }
    allowed_value: {label: "Count" value: "count" }
    allowed_value: {label: "Median Sale Price" value: "median_sale_price" }
    allowed_value: {label: "Return Rate" value: "return_rate" }
    allowed_value: {label: "Returned Count" value: "returned_count" }
    allowed_value: {label: "Returned Total Sale Price" value: "returned_total_sale_price" }
  }


  dimension: dynamic_operation_1 {
    sql:
    {% if operation_1._parameter_value == 'Add' %}
    {{ measure_1._parameter_value}} + {{ measure_2._parameter_value}}
    {% elsif operation_1._parameter_value == 'Subtract' %}
    {{ measure_1._parameter_value}} + {{ measure_2._parameter_value}}
    {% elsif operation_1._parameter_value == 'Multiply' %}
    {{ measure_1._parameter_value}} + {{ measure_2._parameter_value}}
    {% elsif operation_1._parameter_value == 'Divide' %}
    {{ measure_1._parameter_value}} + {{ measure_2._parameter_value}}
    {% endif %} ;;
  }





    dimension: created_date {
      description: ""
      type: date
    }
    measure: average_sale_price {}
    measure: total_sale_price {}
    measure: average_days_to_process {}
    measure: average_shipping_time {}
    measure: count {}
    measure: median_sale_price {}
    measure: return_rate {}
    measure: returned_count {}
    measure: returned_total_sale_price { }
  }
