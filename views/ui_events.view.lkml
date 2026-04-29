# AUTO-GENERATED — payments_demo LookML project
view: ui_events {
  sql_table_name: `modus-playground.payments_demo.ui_events` ;;
  label: "Ui Events"
  view_label: "Ui Events"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to sessions.id"
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

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: referrer_url {
    type: string
    sql: ${TABLE}.referrer_url ;;
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

  dimension: viewport_width {
    type: number
    sql: ${TABLE}.viewport_width ;;
  }

  dimension: viewport_height {
    type: number
    sql: ${TABLE}.viewport_height ;;
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

  dimension: properties_json {
    type: string
    sql: ${TABLE}.properties_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: feature_flag_assignments_json {
    type: string
    sql: ${TABLE}.feature_flag_assignments_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: latency_ms {
    type: number
    sql: ${TABLE}.latency_ms ;;
    value_format_name: decimal_0
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
