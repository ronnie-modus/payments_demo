# AUTO-GENERATED — payments_demo LookML project
view: fraud_scores {
  sql_table_name: `modus-playground.payments_demo.fraud_scores` ;;
  label: "Fraud Scores"
  view_label: "Fraud Scores"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.target_type ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.target_id ;;
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

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
    value_format_name: percent_2
  }

  dimension: score_band {
    type: string
    sql: ${TABLE}.score_band ;;
  }

  dimension: model_version {
    type: string
    sql: ${TABLE}.model_version ;;
  }

  dimension: triggered_rules_json {
    type: string
    sql: ${TABLE}.triggered_rules_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: ip_country {
    type: string
    sql: ${TABLE}.ip_country ;;
  }

  dimension: velocity_24h_count {
    type: number
    sql: ${TABLE}.velocity_24h_count ;;
    group_label: "Metrics"
  }

  dimension: velocity_24h_amount_usd {
    type: number
    sql: ${TABLE}.velocity_24h_amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: device_seen_before {
    type: yesno
    sql: ${TABLE}.device_seen_before = TRUE ;;
  }

  dimension: decision {
    type: string
    sql: ${TABLE}.decision ;;
  }

  dimension: was_overridden {
    type: yesno
    sql: ${TABLE}.was_overridden = TRUE ;;
  }

  dimension: override_user_id {
    type: number
    sql: ${TABLE}.override_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: email_first_seen {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.email_first_seen_at ;;
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
    drill_fields: [id, created_date]
  }


  measure: total_velocity_24h_amount_usd {
    type: sum
    sql: ${TABLE}.velocity_24h_amount_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_velocity_24h_count {
    type: sum
    sql: ${TABLE}.velocity_24h_count ;;
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
