# AUTO-GENERATED — payments_demo LookML project
view: kyc_kyb_check_steps {
  sql_table_name: `modus-playground.payments_demo.kyc_kyb_check_steps` ;;
  label: "Kyc Kyb Check Steps"
  view_label: "Kyc Kyb Check Steps"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: kyc_kyb_check_id {
    type: number
    sql: ${TABLE}.kyc_kyb_check_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to kyc_kyb_checks.id"
  }

  dimension: step_number {
    type: number
    sql: ${TABLE}.step_number ;;
  }

  dimension: step_name {
    type: string
    sql: ${TABLE}.step_name ;;
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

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
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


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, status, created_date]
  }




  measure: avg_duration_seconds {
    type: average
    sql: ${TABLE}.duration_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }


}
