# AUTO-GENERATED — payments_demo LookML project
view: feature_flags {
  sql_table_name: `modus-playground.payments_demo.feature_flags` ;;
  label: "Feature Flags"
  view_label: "Feature Flags"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: flag_key {
    type: string
    sql: ${TABLE}.flag_key ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: rollout_strategy {
    type: string
    sql: ${TABLE}.rollout_strategy ;;
  }

  dimension: current_rollout_percent {
    type: number
    sql: ${TABLE}.current_rollout_percent ;;
    value_format: "0.0\"%\""
    group_label: "Metrics"
  }

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: archived {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.archived_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, status, created_date]
  }






}
