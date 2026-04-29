# AUTO-GENERATED — payments_demo LookML project
view: invoice_lines {
  sql_table_name: `modus-playground.payments_demo.invoice_lines` ;;
  label: "Invoice Lines"
  view_label: "Invoice Lines"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoices.id"
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

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}.revenue_category ;;
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
