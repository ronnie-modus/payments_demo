# AUTO-GENERATED — payments_demo LookML project
view: industries {
  sql_table_name: `modus-playground.payments_demo.industries` ;;
  label: "Industries"
  view_label: "Industries"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: naics_code {
    type: string
    sql: ${TABLE}.naics_code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: sub_sector {
    type: string
    sql: ${TABLE}.sub_sector ;;
  }

  dimension: risk_band {
    type: string
    sql: ${TABLE}.risk_band ;;
  }

  dimension: typical_chargeback_rate {
    type: number
    sql: ${TABLE}.typical_chargeback_rate ;;
    value_format_name: percent_2
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
