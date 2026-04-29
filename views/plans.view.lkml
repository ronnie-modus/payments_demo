# AUTO-GENERATED — payments_demo LookML project
view: plans {
  sql_table_name: `modus-playground.payments_demo.plans` ;;
  label: "Plans"
  view_label: "Plans"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}.tier ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: billing_period {
    type: string
    sql: ${TABLE}.billing_period ;;
  }

  dimension: base_price_usd {
    type: number
    sql: ${TABLE}.base_price_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: included_payments_count {
    type: number
    sql: ${TABLE}.included_payments_count ;;
    group_label: "Metrics"
  }

  dimension: overage_price_per_payment_usd {
    type: number
    sql: ${TABLE}.overage_price_per_payment_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: card_acceptance_pct_fee {
    type: number
    sql: ${TABLE}.card_acceptance_pct_fee ;;
    value_format_name: percent_2
  }

  dimension: ach_per_transaction_usd {
    type: number
    sql: ${TABLE}.ach_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: wire_per_transaction_usd {
    type: number
    sql: ${TABLE}.wire_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: international_per_transaction_usd {
    type: number
    sql: ${TABLE}.international_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: fx_margin_bps {
    type: number
    sql: ${TABLE}.fx_margin_bps ;;
    value_format: "0\" bps\""
  }

  dimension: max_users {
    type: number
    sql: ${TABLE}.max_users ;;
  }

  dimension: max_counterparties {
    type: number
    sql: ${TABLE}.max_counterparties ;;
  }

  dimension: includes_ocr {
    type: yesno
    sql: ${TABLE}.includes_ocr = TRUE ;;
  }

  dimension: includes_approvals {
    type: yesno
    sql: ${TABLE}.includes_approvals = TRUE ;;
  }

  dimension: includes_api {
    type: yesno
    sql: ${TABLE}.includes_api = TRUE ;;
  }

  dimension: is_active_for_new_signups {
    type: yesno
    sql: ${TABLE}.is_active_for_new_signups = TRUE ;;
  }

  dimension_group: launched {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.launched_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: sunsetted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sunsetted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
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
    drill_fields: [id, name, created_date]
  }


  measure: total_base_price_usd {
    type: sum
    sql: ${TABLE}.base_price_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_overage_price_per_payment_usd {
    type: sum
    sql: ${TABLE}.overage_price_per_payment_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_ach_per_transaction_usd {
    type: sum
    sql: ${TABLE}.ach_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_wire_per_transaction_usd {
    type: sum
    sql: ${TABLE}.wire_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_international_per_transaction_usd {
    type: sum
    sql: ${TABLE}.international_per_transaction_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_included_payments_count {
    type: sum
    sql: ${TABLE}.included_payments_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }



}
