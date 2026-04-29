# AUTO-GENERATED — payments_demo LookML project
view: dispute_evidence {
  sql_table_name: `modus-playground.payments_demo.dispute_evidence` ;;
  label: "Dispute Evidence"
  view_label: "Dispute Evidence"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: dispute_case_id {
    type: number
    sql: ${TABLE}.dispute_case_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to dispute_cases.id"
  }

  dimension: evidence_type {
    type: string
    sql: ${TABLE}.evidence_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: submitted_by_user_id {
    type: number
    sql: ${TABLE}.submitted_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: accepted_by_network {
    type: yesno
    sql: ${TABLE}.accepted_by_network = TRUE ;;
  }

  dimension_group: submitted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.submitted_at ;;
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






}
