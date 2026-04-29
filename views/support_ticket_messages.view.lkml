# AUTO-GENERATED — payments_demo LookML project
view: support_ticket_messages {
  sql_table_name: `modus-playground.payments_demo.support_ticket_messages` ;;
  label: "Support Ticket Messages"
  view_label: "Support Ticket Messages"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: support_ticket_id {
    type: number
    sql: ${TABLE}.support_ticket_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to support_tickets.id"
  }

  dimension: sender_type {
    type: string
    sql: ${TABLE}.sender_type ;;
  }

  dimension: sender_user_id {
    type: number
    sql: ${TABLE}.sender_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: message_text {
    type: string
    sql: ${TABLE}.message_text ;;
  }

  dimension: is_internal_note {
    type: yesno
    sql: ${TABLE}.is_internal_note = TRUE ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sent_at ;;
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
