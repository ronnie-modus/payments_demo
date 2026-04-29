# AUTO-GENERATED — payments_demo LookML project
view: subscription_usage {
  sql_table_name: `modus-playground.payments_demo.subscription_usage` ;;
  label: "Subscription Usage"
  view_label: "Subscription Usage"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to subscriptions.id"
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: ach_payment_count {
    type: number
    sql: ${TABLE}.ach_payment_count ;;
    group_label: "Metrics"
  }

  dimension: wire_payment_count {
    type: number
    sql: ${TABLE}.wire_payment_count ;;
    group_label: "Metrics"
  }

  dimension: card_acceptance_volume_usd {
    type: number
    sql: ${TABLE}.card_acceptance_volume_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: international_payment_count {
    type: number
    sql: ${TABLE}.international_payment_count ;;
    group_label: "Metrics"
  }

  dimension: fx_volume_usd {
    type: number
    sql: ${TABLE}.fx_volume_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: ocr_extractions_count {
    type: number
    sql: ${TABLE}.ocr_extractions_count ;;
    group_label: "Metrics"
  }

  dimension: api_calls_count {
    type: number
    sql: ${TABLE}.api_calls_count ;;
    group_label: "Metrics"
  }

  dimension: active_users_count {
    type: number
    sql: ${TABLE}.active_users_count ;;
    group_label: "Metrics"
  }

  dimension: overage_amount_usd {
    type: number
    sql: ${TABLE}.overage_amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: total_billed_usd {
    type: number
    sql: ${TABLE}.total_billed_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension_group: period_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_start ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: period_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_end ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
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


  measure: total_card_acceptance_volume_usd {
    type: sum
    sql: ${TABLE}.card_acceptance_volume_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_fx_volume_usd {
    type: sum
    sql: ${TABLE}.fx_volume_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_overage_amount_usd {
    type: sum
    sql: ${TABLE}.overage_amount_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: sum_total_billed_usd {
    type: sum
    sql: ${TABLE}.total_billed_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_ach_payment_count {
    type: sum
    sql: ${TABLE}.ach_payment_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_wire_payment_count {
    type: sum
    sql: ${TABLE}.wire_payment_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_international_payment_count {
    type: sum
    sql: ${TABLE}.international_payment_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_ocr_extractions_count {
    type: sum
    sql: ${TABLE}.ocr_extractions_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_api_calls_count {
    type: sum
    sql: ${TABLE}.api_calls_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_active_users_count {
    type: sum
    sql: ${TABLE}.active_users_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }


  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
