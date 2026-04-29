# AUTO-GENERATED — payments_demo LookML project
view: support_tickets {
  sql_table_name: `modus-playground.payments_demo.support_tickets` ;;
  label: "Support Tickets"
  view_label: "Support Tickets"
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

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: assigned_user_id {
    type: number
    sql: ${TABLE}.assigned_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  dimension: feature_area {
    type: string
    sql: ${TABLE}.feature_area ;;
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

  dimension: sentiment {
    type: string
    sql: ${TABLE}.sentiment ;;
  }

  dimension: time_to_first_response_seconds {
    type: number
    sql: ${TABLE}.time_to_first_response_seconds ;;
    value_format_name: decimal_0
  }

  dimension: time_to_resolution_seconds {
    type: number
    sql: ${TABLE}.time_to_resolution_seconds ;;
    value_format_name: decimal_0
  }

  dimension: sla_breached {
    type: yesno
    sql: ${TABLE}.sla_breached = TRUE ;;
  }

  dimension: resolution_summary {
    type: string
    sql: ${TABLE}.resolution_summary ;;
  }

  dimension: csat_score {
    type: number
    sql: ${TABLE}.csat_score ;;
    group_label: "Metrics"
  }

  dimension: linked_release_id {
    type: number
    sql: ${TABLE}.linked_release_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to releases.id"
  }

  dimension: message_count {
    type: number
    sql: ${TABLE}.message_count ;;
    group_label: "Metrics"
  }

  dimension: reopened_count {
    type: number
    sql: ${TABLE}.reopened_count ;;
    group_label: "Metrics"
  }

  dimension: escalated {
    type: yesno
    sql: ${TABLE}.escalated = TRUE ;;
  }

  dimension: escalated_to_user_id {
    type: number
    sql: ${TABLE}.escalated_to_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: first_response {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_response_at ;;
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

  dimension_group: closed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.closed_at ;;
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


  measure: count_new {
    type: count
    filters: [status: "new"]
    label: "Count New"
    group_label: "Status Counts"
  }
  measure: count_open {
    type: count
    filters: [status: "open"]
    label: "Count Open"
    group_label: "Status Counts"
  }
  measure: count_pending {
    type: count
    filters: [status: "pending"]
    label: "Count Pending"
    group_label: "Status Counts"
  }
  measure: count_resolved {
    type: count
    filters: [status: "resolved"]
    label: "Count Resolved"
    group_label: "Status Counts"
  }
  measure: count_closed {
    type: count
    filters: [status: "closed"]
    label: "Count Closed"
    group_label: "Status Counts"
  }


  measure: sum_message_count {
    type: sum
    sql: ${TABLE}.message_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_reopened_count {
    type: sum
    sql: ${TABLE}.reopened_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }

  measure: avg_time_to_first_response_seconds {
    type: average
    sql: ${TABLE}.time_to_first_response_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }
  measure: avg_time_to_resolution_seconds {
    type: average
    sql: ${TABLE}.time_to_resolution_seconds ;;
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
