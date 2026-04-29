# AUTO-GENERATED — payments_demo LookML project
view: email_events {
  sql_table_name: `modus-playground.payments_demo.email_events` ;;
  label: "Email Events"
  view_label: "Email Events"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: email_id {
    type: number
    sql: ${TABLE}.email_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to emails.id"
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: clicked_url {
    type: string
    sql: ${TABLE}.clicked_url ;;
  }

  dimension_group: occurred {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.occurred_at ;;
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
