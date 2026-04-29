# AUTO-GENERATED — payments_demo LookML project
view: payment_attempts {
  sql_table_name: `modus-playground.payments_demo.payment_attempts` ;;
  label: "Payment Attempts"
  view_label: "Payment Attempts"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: attempt_number {
    type: number
    sql: ${TABLE}.attempt_number ;;
  }

  dimension: processor_id {
    type: number
    sql: ${TABLE}.processor_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to processors.id"
  }

  dimension: processor_reference {
    type: string
    sql: ${TABLE}.processor_reference ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
    group_label: "Status"
  }

  dimension: processor_response_code {
    type: string
    sql: ${TABLE}.processor_response_code ;;
  }

  dimension: processor_response_message {
    type: string
    sql: ${TABLE}.processor_response_message ;;
  }

  dimension: latency_ms {
    type: number
    sql: ${TABLE}.latency_ms ;;
    value_format_name: decimal_0
  }

  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: retry_scheduled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.retry_scheduled_at ;;
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
