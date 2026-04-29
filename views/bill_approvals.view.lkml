# AUTO-GENERATED — payments_demo LookML project
view: bill_approvals {
  sql_table_name: `modus-playground.payments_demo.bill_approvals` ;;
  label: "Bill Approvals"
  view_label: "Bill Approvals"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: bill_id {
    type: number
    sql: ${TABLE}.bill_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bills.id"
  }

  dimension: approval_workflow_id {
    type: number
    sql: ${TABLE}.approval_workflow_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bill_approval_workflows.id"
  }

  dimension: step_number {
    type: number
    sql: ${TABLE}.step_number ;;
  }

  dimension: approver_user_id {
    type: number
    sql: ${TABLE}.approver_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: sla_seconds {
    type: number
    sql: ${TABLE}.sla_seconds ;;
    value_format_name: decimal_0
  }

  dimension: was_overdue {
    type: yesno
    sql: ${TABLE}.was_overdue = TRUE ;;
  }

  dimension_group: action {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.action_at ;;
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




  measure: avg_sla_seconds {
    type: average
    sql: ${TABLE}.sla_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }


}
