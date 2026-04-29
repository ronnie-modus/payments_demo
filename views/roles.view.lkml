# AUTO-GENERATED — payments_demo LookML project
view: roles {
  sql_table_name: `modus-playground.payments_demo.roles` ;;
  label: "Roles"
  view_label: "Roles"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: permissions_json {
    type: string
    sql: ${TABLE}.permissions_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}.is_system = TRUE ;;
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
