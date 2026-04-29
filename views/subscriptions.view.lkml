# AUTO-GENERATED — payments_demo LookML project
view: subscriptions {
  sql_table_name: `modus-playground.payments_demo.subscriptions` ;;
  label: "Subscriptions"
  view_label: "Subscriptions"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to plans.id"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: mrr_usd {
    type: number
    sql: ${TABLE}.mrr_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: arr_usd {
    type: number
    sql: ${TABLE}.arr_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: discount_percent {
    type: number
    sql: ${TABLE}.discount_percent ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: custom_pricing_json {
    type: string
    sql: ${TABLE}.custom_pricing_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: auto_renew {
    type: yesno
    sql: ${TABLE}.auto_renew = TRUE ;;
  }

  dimension: renewal_count {
    type: number
    sql: ${TABLE}.renewal_count ;;
    group_label: "Metrics"
  }

  dimension: upgraded_from_subscription_id {
    type: number
    sql: ${TABLE}.upgraded_from_subscription_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to subscriptions.id"
  }

  dimension_group: trial_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trial_started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: trial_ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trial_ended_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: converted_to_paid {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.converted_to_paid_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: current_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.current_period_start ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: current_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.current_period_end ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: canceled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.canceled_at ;;
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
    drill_fields: [id, status, created_date]
  }


  measure: count_trialing {
    type: count
    filters: [status: "trialing"]
    label: "Count Trialing"
    group_label: "Status Counts"
  }
  measure: count_active {
    type: count
    filters: [status: "active"]
    label: "Count Active"
    group_label: "Status Counts"
  }
  measure: count_past_due {
    type: count
    filters: [status: "past_due"]
    label: "Count Past Due"
    group_label: "Status Counts"
  }
  measure: count_paused {
    type: count
    filters: [status: "paused"]
    label: "Count Paused"
    group_label: "Status Counts"
  }
  measure: count_canceled {
    type: count
    filters: [status: "canceled"]
    label: "Count Canceled"
    group_label: "Status Counts"
  }

  measure: total_mrr_usd {
    type: sum
    sql: ${TABLE}.mrr_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_arr_usd {
    type: sum
    sql: ${TABLE}.arr_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_renewal_count {
    type: sum
    sql: ${TABLE}.renewal_count ;;
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
