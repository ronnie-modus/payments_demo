# AUTO-GENERATED — payments_demo LookML project
view: plan_features {
  sql_table_name: `modus-playground.payments_demo.plan_features` ;;
  label: "Plan Features"
  view_label: "Plan Features"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to plans.id"
  }

  dimension: feature_key {
    type: string
    sql: ${TABLE}.feature_key ;;
  }

  dimension: feature_value {
    type: string
    sql: ${TABLE}.feature_value ;;
  }

  dimension: is_enabled {
    type: yesno
    sql: ${TABLE}.is_enabled = TRUE ;;
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






}
