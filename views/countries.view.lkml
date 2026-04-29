# AUTO-GENERATED — payments_demo LookML project
view: countries {
  sql_table_name: `modus-playground.payments_demo.countries` ;;
  label: "Countries"
  view_label: "Countries"
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

  dimension: iso_alpha2 {
    type: string
    sql: ${TABLE}.iso_alpha2 ;;
  }

  dimension: iso_alpha3 {
    type: string
    sql: ${TABLE}.iso_alpha3 ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sub_region {
    type: string
    sql: ${TABLE}.sub_region ;;
  }

  dimension: default_currency_code {
    type: string
    sql: ${TABLE}.default_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: is_high_risk {
    type: yesno
    sql: ${TABLE}.is_high_risk = TRUE ;;
  }

  dimension: sanctions_status {
    type: string
    sql: ${TABLE}.sanctions_status ;;
  }

  dimension: supports_ach {
    type: yesno
    sql: ${TABLE}.supports_ach = TRUE ;;
  }

  dimension: supports_local_wire {
    type: yesno
    sql: ${TABLE}.supports_local_wire = TRUE ;;
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
