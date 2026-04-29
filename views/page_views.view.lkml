# AUTO-GENERATED — payments_demo LookML project
view: page_views {
  sql_table_name: `modus-playground.payments_demo.page_views` ;;
  label: "Page Views"
  view_label: "Page Views"
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

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_category {
    type: string
    sql: ${TABLE}.page_category ;;
  }

  dimension: time_on_page_seconds {
    type: number
    sql: ${TABLE}.time_on_page_seconds ;;
    value_format_name: decimal_0
  }

  dimension: scroll_depth_pct {
    type: number
    sql: ${TABLE}.scroll_depth_pct ;;
    value_format: "0.0\"%\""
    group_label: "Metrics"
  }

  dimension: had_error {
    type: yesno
    sql: ${TABLE}.had_error = TRUE ;;
  }

  dimension: referrer_path {
    type: string
    sql: ${TABLE}.referrer_path ;;
  }

  dimension_group: viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.viewed_at ;;
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




  measure: avg_time_on_page_seconds {
    type: average
    sql: ${TABLE}.time_on_page_seconds ;;
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
