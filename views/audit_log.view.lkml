# AUTO-GENERATED — payments_demo LookML project
view: audit_log {
  sql_table_name: `modus-playground.payments_demo.audit_log` ;;
  label: "Audit Log"
  view_label: "Audit Log"
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

  dimension: actor_user_id {
    type: number
    sql: ${TABLE}.actor_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: actor_type {
    type: string
    sql: ${TABLE}.actor_type ;;
  }

  dimension: actor_api_key_id {
    type: number
    sql: ${TABLE}.actor_api_key_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to api_keys.id"
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.target_type ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.target_id ;;
    hidden: yes
    value_format_name: id
  }

  dimension: before_json {
    type: string
    sql: ${TABLE}.before_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: after_json {
    type: string
    sql: ${TABLE}.after_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
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





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
