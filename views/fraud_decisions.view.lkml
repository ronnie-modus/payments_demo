# AUTO-GENERATED — payments_demo LookML project
view: fraud_decisions {
  sql_table_name: `modus-playground.payments_demo.fraud_decisions` ;;
  label: "Fraud Decisions"
  view_label: "Fraud Decisions"
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

  dimension: fraud_review_queue_id {
    type: number
    sql: ${TABLE}.fraud_review_queue_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to fraud_review_queue.id"
  }

  dimension: decided_by {
    type: string
    sql: ${TABLE}.decided_by ;;
  }

  dimension: decided_by_user_id {
    type: number
    sql: ${TABLE}.decided_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: decision {
    type: string
    sql: ${TABLE}.decision ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension_group: decided {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.decided_at ;;
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
