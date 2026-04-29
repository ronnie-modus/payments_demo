# AUTO-GENERATED — payments_demo LookML project
view: fx_conversions {
  sql_table_name: `modus-playground.payments_demo.fx_conversions` ;;
  label: "Fx Conversions"
  view_label: "Fx Conversions"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: from_currency_code {
    type: string
    sql: ${TABLE}.from_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: to_currency_code {
    type: string
    sql: ${TABLE}.to_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: rate_applied {
    type: number
    sql: ${TABLE}.rate_applied ;;
  }

  dimension: reference_rate {
    type: number
    sql: ${TABLE}.reference_rate ;;
  }

  dimension: margin_bps {
    type: number
    sql: ${TABLE}.margin_bps ;;
    value_format: "0\" bps\""
  }

  dimension: from_amount {
    type: number
    sql: ${TABLE}.from_amount ;;
    value_format_name: decimal_2
  }

  dimension: to_amount {
    type: number
    sql: ${TABLE}.to_amount ;;
    value_format_name: decimal_2
  }

  dimension: margin_amount_usd {
    type: number
    sql: ${TABLE}.margin_amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: processor_id {
    type: number
    sql: ${TABLE}.processor_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to processors.id"
  }

  dimension_group: converted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.converted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id]
  }


  measure: total_margin_amount_usd {
    type: sum
    sql: ${TABLE}.margin_amount_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }




}
