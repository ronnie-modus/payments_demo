# AUTO-GENERATED — payments_demo LookML project
view: sessions {
  sql_table_name: `modus-playground.payments_demo.sessions` ;;
  label: "Sessions"
  view_label: "Sessions"
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

  dimension: session_type {
    type: string
    sql: ${TABLE}.session_type ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
    value_format_name: decimal_0
  }

  dimension: event_count {
    type: number
    sql: ${TABLE}.event_count ;;
    group_label: "Metrics"
  }

  dimension: ended_reason {
    type: string
    sql: ${TABLE}.ended_reason ;;
  }

  dimension: auth_method {
    type: string
    sql: ${TABLE}.auth_method ;;
  }

  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
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



  measure: sum_event_count {
    type: sum
    sql: ${TABLE}.event_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }

  measure: avg_duration_seconds {
    type: average
    sql: ${TABLE}.duration_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }

  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
