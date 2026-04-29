# AUTO-GENERATED — payments_demo LookML project
view: partnerships {
  sql_table_name: `modus-playground.payments_demo.partnerships` ;;
  label: "Partnerships"
  view_label: "Partnerships"
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

  dimension: partnership_type {
    type: string
    sql: ${TABLE}.partnership_type ;;
  }

  dimension: partner_short_code {
    type: string
    sql: ${TABLE}.partner_short_code ;;
  }

  dimension: revenue_share_percent {
    type: number
    sql: ${TABLE}.revenue_share_percent ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: onboarded_orgs_count {
    type: number
    sql: ${TABLE}.onboarded_orgs_count ;;
    group_label: "Metrics"
  }

  dimension: total_arr_usd {
    type: number
    sql: ${TABLE}.total_arr_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: started_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: ended_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
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


  measure: sum_total_arr_usd {
    type: sum
    sql: ${TABLE}.total_arr_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_onboarded_orgs_count {
    type: sum
    sql: ${TABLE}.onboarded_orgs_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }



}
