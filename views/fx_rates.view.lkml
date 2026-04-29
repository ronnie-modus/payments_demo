# AUTO-GENERATED — payments_demo LookML project
view: fx_rates {
  sql_table_name: `modus-playground.payments_demo.fx_rates` ;;
  label: "Fx Rates"
  view_label: "Fx Rates"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: from_currency_code {
    type: string
    sql: ${TABLE}.from_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: to_currency_code {
    type: string
    sql: ${TABLE}.to_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  dimension: rate_source {
    type: string
    sql: ${TABLE}.rate_source ;;
  }

  dimension_group: effective {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.effective_at ;;
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






}
