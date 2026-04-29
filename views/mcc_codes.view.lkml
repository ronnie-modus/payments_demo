# AUTO-GENERATED — payments_demo LookML project
view: mcc_codes {
  sql_table_name: `modus-playground.payments_demo.mcc_codes` ;;
  label: "Mcc Codes"
  view_label: "Mcc Codes"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: mcc {
    type: string
    sql: ${TABLE}.mcc ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: risk_band {
    type: string
    sql: ${TABLE}.risk_band ;;
  }

  dimension: typical_interchange_bps {
    type: number
    sql: ${TABLE}.typical_interchange_bps ;;
    value_format: "0\" bps\""
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
