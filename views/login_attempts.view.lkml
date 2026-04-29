# AUTO-GENERATED — payments_demo LookML project
view: login_attempts {
  sql_table_name: `modus-playground.payments_demo.login_attempts` ;;
  label: "Login Attempts"
  view_label: "Login Attempts"
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

  dimension: email_attempted {
    type: string
    sql: ${TABLE}.email_attempted ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
    group_label: "Status"
  }

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: auth_method {
    type: string
    sql: ${TABLE}.auth_method ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}.risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension_group: attempted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.attempted_at ;;
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
