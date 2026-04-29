# AUTO-GENERATED — payments_demo LookML project
view: kyc_kyb_checks {
  sql_table_name: `modus-playground.payments_demo.kyc_kyb_checks` ;;
  label: "Kyc Kyb Checks"
  view_label: "Kyc Kyb Checks"
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

  dimension: check_type {
    type: string
    sql: ${TABLE}.check_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
    value_format_name: decimal_0
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: provider_reference {
    type: string
    sql: ${TABLE}.provider_reference ;;
  }

  dimension: overall_risk_score {
    type: number
    sql: ${TABLE}.overall_risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: reviewer_user_id {
    type: number
    sql: ${TABLE}.reviewer_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: reviewer_decision {
    type: string
    sql: ${TABLE}.reviewer_decision ;;
  }

  dimension: reviewer_notes {
    type: string
    sql: ${TABLE}.reviewer_notes ;;
  }

  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.completed_at ;;
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


  measure: count_pending {
    type: count
    filters: [status: "pending"]
    label: "Count Pending"
    group_label: "Status Counts"
  }
  measure: count_in_progress {
    type: count
    filters: [status: "in_progress"]
    label: "Count In Progress"
    group_label: "Status Counts"
  }
  measure: count_passed {
    type: count
    filters: [status: "passed"]
    label: "Count Passed"
    group_label: "Status Counts"
  }
  measure: count_failed {
    type: count
    filters: [status: "failed"]
    label: "Count Failed"
    group_label: "Status Counts"
  }
  measure: count_manual_review {
    type: count
    filters: [status: "manual_review"]
    label: "Count Manual Review"
    group_label: "Status Counts"
  }



  measure: avg_duration_seconds {
    type: average
    sql: ${TABLE}.duration_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }

  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
