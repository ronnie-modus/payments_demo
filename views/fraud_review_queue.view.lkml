# AUTO-GENERATED — payments_demo LookML project
view: fraud_review_queue {
  sql_table_name: `modus-playground.payments_demo.fraud_review_queue` ;;
  label: "Fraud Review Queue"
  view_label: "Fraud Review Queue"
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

  dimension: fraud_score_id {
    type: number
    sql: ${TABLE}.fraud_score_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to fraud_scores.id"
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
    group_label: "Status"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: assigned_user_id {
    type: number
    sql: ${TABLE}.assigned_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: time_in_queue_seconds {
    type: number
    sql: ${TABLE}.time_in_queue_seconds ;;
    value_format_name: decimal_0
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
  }

  dimension: resolution_notes {
    type: string
    sql: ${TABLE}.resolution_notes ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: picked_up {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.picked_up_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: resolved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.resolved_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: sla_due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sla_due_at ;;
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
  measure: count_in_review {
    type: count
    filters: [status: "in_review"]
    label: "Count In Review"
    group_label: "Status Counts"
  }
  measure: count_resolved {
    type: count
    filters: [status: "resolved"]
    label: "Count Resolved"
    group_label: "Status Counts"
  }
  measure: count_escalated {
    type: count
    filters: [status: "escalated"]
    label: "Count Escalated"
    group_label: "Status Counts"
  }



  measure: avg_time_in_queue_seconds {
    type: average
    sql: ${TABLE}.time_in_queue_seconds ;;
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
