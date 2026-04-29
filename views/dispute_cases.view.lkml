# AUTO-GENERATED — payments_demo LookML project
view: dispute_cases {
  sql_table_name: `modus-playground.payments_demo.dispute_cases` ;;
  label: "Dispute Cases"
  view_label: "Dispute Cases"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: chargeback_id {
    type: number
    sql: ${TABLE}.chargeback_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to chargebacks.id"
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: assigned_user_id {
    type: number
    sql: ${TABLE}.assigned_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
    group_label: "Status"
  }

  dimension: sla_breached {
    type: yesno
    sql: ${TABLE}.sla_breached = TRUE ;;
  }

  dimension: time_to_first_touch_seconds {
    type: number
    sql: ${TABLE}.time_to_first_touch_seconds ;;
    value_format_name: decimal_0
  }

  dimension: time_to_submit_seconds {
    type: number
    sql: ${TABLE}.time_to_submit_seconds ;;
    value_format_name: decimal_0
  }

  dimension: evidence_count {
    type: number
    sql: ${TABLE}.evidence_count ;;
    group_label: "Metrics"
  }

  dimension: internal_notes {
    type: string
    sql: ${TABLE}.internal_notes ;;
  }

  dimension: resolution_outcome {
    type: string
    sql: ${TABLE}.resolution_outcome ;;
  }

  dimension_group: sla_due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sla_due_at ;;
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

  dimension_group: resolved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.resolved_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, status, created_date]
  }


  measure: count_new {
    type: count
    filters: [status: "new"]
    label: "Count New"
    group_label: "Status Counts"
  }
  measure: count_investigating {
    type: count
    filters: [status: "investigating"]
    label: "Count Investigating"
    group_label: "Status Counts"
  }
  measure: count_evidence_collected {
    type: count
    filters: [status: "evidence_collected"]
    label: "Count Evidence Collected"
    group_label: "Status Counts"
  }
  measure: count_submitted {
    type: count
    filters: [status: "submitted"]
    label: "Count Submitted"
    group_label: "Status Counts"
  }
  measure: count_resolved {
    type: count
    filters: [status: "resolved"]
    label: "Count Resolved"
    group_label: "Status Counts"
  }


  measure: sum_evidence_count {
    type: sum
    sql: ${TABLE}.evidence_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }

  measure: avg_time_to_first_touch_seconds {
    type: average
    sql: ${TABLE}.time_to_first_touch_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }
  measure: avg_time_to_submit_seconds {
    type: average
    sql: ${TABLE}.time_to_submit_seconds ;;
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
