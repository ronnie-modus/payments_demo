# AUTO-GENERATED — payments_demo LookML project
view: releases {
  sql_table_name: `modus-playground.payments_demo.releases` ;;
  label: "Releases"
  view_label: "Releases"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: release_type {
    type: string
    sql: ${TABLE}.release_type ;;
  }

  dimension: affected_areas {
    type: string
    sql: ${TABLE}.affected_areas ;;
  }

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: has_release_notes {
    type: yesno
    sql: ${TABLE}.has_release_notes = TRUE ;;
  }

  dimension: has_breaking_changes_documented {
    type: yesno
    sql: ${TABLE}.has_breaking_changes_documented = TRUE ;;
  }

  dimension: feature_flag_id {
    type: number
    sql: ${TABLE}.feature_flag_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to feature_flags.id"
  }

  dimension: linked_partnership_id {
    type: number
    sql: ${TABLE}.linked_partnership_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to partnerships.id"
  }

  dimension_group: released {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.released_at ;;
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
    drill_fields: [id, name, created_date]
  }






}
