# AUTO-GENERATED — payments_demo LookML project
view: api_keys {
  sql_table_name: `modus-playground.payments_demo.api_keys` ;;
  label: "Api Keys"
  view_label: "Api Keys"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: key_prefix {
    type: string
    sql: ${TABLE}.key_prefix ;;
  }

  dimension: key_hash {
    type: string
    sql: ${TABLE}.key_hash ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension_group: last_used {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_used_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
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





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
