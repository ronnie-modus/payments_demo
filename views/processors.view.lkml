# AUTO-GENERATED — payments_demo LookML project
view: processors {
  sql_table_name: `modus-playground.payments_demo.processors` ;;
  label: "Processors"
  view_label: "Processors"
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

  dimension: processor_type {
    type: string
    sql: ${TABLE}.processor_type ;;
  }

  dimension: supports_currencies {
    type: string
    sql: ${TABLE}.supports_currencies ;;
  }

  dimension: supports_countries {
    type: string
    sql: ${TABLE}.supports_countries ;;
  }

  dimension: baseline_decline_rate {
    type: number
    sql: ${TABLE}.baseline_decline_rate ;;
    value_format_name: percent_2
  }

  dimension: baseline_latency_ms {
    type: number
    sql: ${TABLE}.baseline_latency_ms ;;
    value_format_name: decimal_0
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active = TRUE ;;
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
