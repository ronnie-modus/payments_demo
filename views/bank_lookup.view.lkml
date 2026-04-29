# AUTO-GENERATED — payments_demo LookML project
view: bank_lookup {
  sql_table_name: `modus-playground.payments_demo.bank_lookup` ;;
  label: "Bank Lookup"
  view_label: "Bank Lookup"
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

  dimension: aba_routing {
    type: string
    sql: ${TABLE}.aba_routing ;;
  }

  dimension: swift_bic {
    type: string
    sql: ${TABLE}.swift_bic ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: supports_same_day_ach {
    type: yesno
    sql: ${TABLE}.supports_same_day_ach = TRUE ;;
  }

  dimension: supports_rtp {
    type: yesno
    sql: ${TABLE}.supports_rtp = TRUE ;;
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
