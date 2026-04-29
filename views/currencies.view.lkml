# AUTO-GENERATED — payments_demo LookML project
view: currencies {
  sql_table_name: `modus-playground.payments_demo.currencies` ;;
  label: "Currencies"
  view_label: "Currencies"
  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
    primary_key: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  dimension: decimal_places {
    type: number
    sql: ${TABLE}.decimal_places ;;
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
    drill_fields: [code, name, created_date]
  }






}
