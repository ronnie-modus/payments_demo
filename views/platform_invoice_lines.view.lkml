# AUTO-GENERATED — payments_demo LookML project
view: platform_invoice_lines {
  sql_table_name: `modus-playground.payments_demo.platform_invoice_lines` ;;
  label: "Platform Invoice Lines"
  view_label: "Platform Invoice Lines"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: platform_invoice_id {
    type: number
    sql: ${TABLE}.platform_invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to platform_invoices.id"
  }

  dimension: line_type {
    type: string
    sql: ${TABLE}.line_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price_usd {
    type: number
    sql: ${TABLE}.unit_price_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: line_total_usd {
    type: number
    sql: ${TABLE}.line_total_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: tax_usd {
    type: number
    sql: ${TABLE}.tax_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
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


  measure: total_unit_price_usd {
    type: sum
    sql: ${TABLE}.unit_price_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_line_total_usd {
    type: sum
    sql: ${TABLE}.line_total_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_tax_usd {
    type: sum
    sql: ${TABLE}.tax_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }




}
