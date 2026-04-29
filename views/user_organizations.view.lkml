# AUTO-GENERATED — payments_demo LookML project
view: user_organizations {
  sql_table_name: `modus-playground.payments_demo.user_organizations` ;;
  label: "User Organizations"
  view_label: "User Organizations"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: relationship_type {
    type: string
    sql: ${TABLE}.relationship_type ;;
  }

  dimension: is_primary {
    type: yesno
    sql: ${TABLE}.is_primary = TRUE ;;
  }

  dimension: invited_by_user_id {
    type: number
    sql: ${TABLE}.invited_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: joined {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.joined_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: left {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.left_at ;;
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

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
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
