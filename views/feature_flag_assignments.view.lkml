# AUTO-GENERATED — payments_demo LookML project
view: feature_flag_assignments {
  sql_table_name: `modus-playground.payments_demo.feature_flag_assignments` ;;
  label: "Feature Flag Assignments"
  view_label: "Feature Flag Assignments"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: feature_flag_id {
    type: number
    sql: ${TABLE}.feature_flag_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to feature_flags.id"
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: variant {
    type: string
    sql: ${TABLE}.variant ;;
  }

  dimension: assigned_by {
    type: string
    sql: ${TABLE}.assigned_by ;;
  }

  dimension_group: assigned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.assigned_at ;;
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





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
