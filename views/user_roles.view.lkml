# AUTO-GENERATED — payments_demo LookML project
view: user_roles {
  sql_table_name: `modus-playground.payments_demo.user_roles` ;;
  label: "User Roles"
  view_label: "User Roles"
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

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to roles.id"
  }

  dimension: granted_by_user_id {
    type: number
    sql: ${TABLE}.granted_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: revoked_by_user_id {
    type: number
    sql: ${TABLE}.revoked_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: granted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.granted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: revoked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.revoked_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id]
  }





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
