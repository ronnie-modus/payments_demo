# AUTO-GENERATED — payments_demo LookML project
view: payment_status_history {
  sql_table_name: `modus-playground.payments_demo.payment_status_history` ;;
  label: "Payment Status History"
  view_label: "Payment Status History"
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

  dimension: from_status {
    type: string
    sql: ${TABLE}.from_status ;;
  }

  dimension: to_status {
    type: string
    sql: ${TABLE}.to_status ;;
  }

  dimension: changed_by {
    type: string
    sql: ${TABLE}.changed_by ;;
  }

  dimension: changed_by_user_id {
    type: number
    sql: ${TABLE}.changed_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension_group: changed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.changed_at ;;
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
