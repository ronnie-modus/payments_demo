# AUTO-GENERATED — payments_demo LookML project
view: counterparty_payment_preferences {
  sql_table_name: `modus-playground.payments_demo.counterparty_payment_preferences` ;;
  label: "Counterparty Payment Preferences"
  view_label: "Counterparty Payment Preferences"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: preferred_payment_method_id {
    type: number
    sql: ${TABLE}.preferred_payment_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payment_methods.id"
  }

  dimension: preferred_delivery_method_id {
    type: number
    sql: ${TABLE}.preferred_delivery_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to delivery_methods.id"
  }

  dimension: auto_pay_enabled {
    type: yesno
    sql: ${TABLE}.auto_pay_enabled = TRUE ;;
  }

  dimension: auto_pay_threshold_usd {
    type: number
    sql: ${TABLE}.auto_pay_threshold_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: auto_pay_day_offset {
    type: number
    sql: ${TABLE}.auto_pay_day_offset ;;
  }

  dimension: early_pay_discount_percent {
    type: number
    sql: ${TABLE}.early_pay_discount_percent ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: late_fee_percent {
    type: number
    sql: ${TABLE}.late_fee_percent ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }


  measure: total_auto_pay_threshold_usd {
    type: sum
    sql: ${TABLE}.auto_pay_threshold_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }




}
