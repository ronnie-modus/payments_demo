# AUTO-GENERATED — payments_demo LookML project
view: customer_health_scores {
  sql_table_name: `modus-playground.payments_demo.customer_health_scores` ;;
  label: "Customer Health Scores"
  view_label: "Customer Health Scores"
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

  dimension: health_score {
    type: number
    sql: ${TABLE}.health_score ;;
    group_label: "Metrics"
  }

  dimension: health_band {
    type: string
    sql: ${TABLE}.health_band ;;
  }

  dimension: login_count_7d {
    type: number
    sql: ${TABLE}.login_count_7d ;;
  }

  dimension: login_count_30d {
    type: number
    sql: ${TABLE}.login_count_30d ;;
  }

  dimension: payments_count_30d {
    type: number
    sql: ${TABLE}.payments_count_30d ;;
  }

  dimension: payment_volume_30d_usd {
    type: number
    sql: ${TABLE}.payment_volume_30d_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: support_ticket_count_30d {
    type: number
    sql: ${TABLE}.support_ticket_count_30d ;;
  }

  dimension: nps_latest {
    type: number
    sql: ${TABLE}.nps_latest ;;
  }

  dimension: days_since_last_payment {
    type: number
    sql: ${TABLE}.days_since_last_payment ;;
    value_format_name: decimal_0
  }

  dimension: days_since_last_login {
    type: number
    sql: ${TABLE}.days_since_last_login ;;
    value_format_name: decimal_0
  }

  dimension: churn_risk_score {
    type: number
    sql: ${TABLE}.churn_risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: primary_risk_signal {
    type: string
    sql: ${TABLE}.primary_risk_signal ;;
  }

  dimension_group: score {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.score_date ;;
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


  measure: total_payment_volume_30d_usd {
    type: sum
    sql: ${TABLE}.payment_volume_30d_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_login_count_7d {
    type: sum
    sql: ${TABLE}.login_count_7d ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_login_count_30d {
    type: sum
    sql: ${TABLE}.login_count_30d ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_payments_count_30d {
    type: sum
    sql: ${TABLE}.payments_count_30d ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_support_ticket_count_30d {
    type: sum
    sql: ${TABLE}.support_ticket_count_30d ;;
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
