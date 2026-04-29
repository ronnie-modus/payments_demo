# AUTO-GENERATED — payments_demo LookML project
view: bill_lines {
  sql_table_name: `modus-playground.payments_demo.bill_lines` ;;
  label: "Bill Lines"
  view_label: "Bill Lines"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: bill_id {
    type: number
    sql: ${TABLE}.bill_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bills.id"
  }

  dimension: line_number {
    type: number
    sql: ${TABLE}.line_number ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
    value_format_name: decimal_2
  }

  dimension: line_total {
    type: number
    sql: ${TABLE}.line_total ;;
    value_format_name: decimal_2
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
    value_format_name: percent_2
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
    value_format_name: decimal_2
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
    value_format_name: decimal_2
  }

  dimension: gl_account_code {
    type: string
    sql: ${TABLE}.gl_account_code ;;
  }

  dimension: department_code {
    type: string
    sql: ${TABLE}.department_code ;;
  }

  dimension: project_code {
    type: string
    sql: ${TABLE}.project_code ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }






}
