# AUTO-GENERATED — payments_demo LookML project
view: release_notes {
  sql_table_name: `modus-playground.payments_demo.release_notes` ;;
  label: "Release Notes"
  view_label: "Release Notes"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: release_id {
    type: number
    sql: ${TABLE}.release_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to releases.id"
  }

  dimension: audience {
    type: string
    sql: ${TABLE}.audience ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: body_md {
    type: string
    sql: ${TABLE}.body_md ;;
  }

  dimension: author_user_id {
    type: number
    sql: ${TABLE}.author_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: published {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.published_at ;;
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
