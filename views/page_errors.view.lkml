# AUTO-GENERATED — payments_demo LookML project
view: page_errors {
  sql_table_name: `modus-playground.payments_demo.page_errors` ;;
  label: "Page Errors"
  view_label: "Page Errors"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: session_id {
    type: number
    sql: SAFE_CAST(${TABLE}.session_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to sessions.id"
  }

  dimension: user_id {
    type: number
    sql: SAFE_CAST(${TABLE}.user_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: organization_id {
    type: number
    sql: SAFE_CAST(${TABLE}.organization_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: registry_counterparty_id {
    type: number
    sql: SAFE_CAST(${TABLE}.registry_counterparty_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to registry_counterparties.id"
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: error_type {
    type: string
    sql: ${TABLE}.error_type ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: error_stack {
    type: string
    sql: ${TABLE}.error_stack ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: browser_version {
    type: string
    sql: ${TABLE}.browser_version ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: feature_flag_assignments_json {
    type: string
    sql: ${TABLE}.feature_flag_assignments_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: user_was_authenticated {
    type: yesno
    sql: ${TABLE}.user_was_authenticated = TRUE ;;
  }

  dimension: was_first_time_visitor {
    type: yesno
    sql: ${TABLE}.was_first_time_visitor = TRUE ;;
  }

  dimension: linked_release_id {
    type: number
    sql: SAFE_CAST(${TABLE}.linked_release_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to releases.id"
  }

  dimension: linked_partnership_id {
    type: number
    sql: SAFE_CAST(${TABLE}.linked_partnership_id AS INT64) ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to partnerships.id"
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
    sql: SAFE_CAST(${TABLE}.organization_id AS INT64) ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
