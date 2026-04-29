# AUTO-GENERATED — payments_demo LookML project
view: counterparty_addresses {
  sql_table_name: `modus-playground.payments_demo.counterparty_addresses` ;;
  label: "Counterparty Addresses"
  view_label: "Counterparty Addresses"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: address_type {
    type: string
    sql: ${TABLE}.address_type ;;
  }

  dimension: line_1 {
    type: string
    sql: ${TABLE}.line_1 ;;
  }

  dimension: line_2 {
    type: string
    sql: ${TABLE}.line_2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state_or_region {
    type: string
    sql: ${TABLE}.state_or_region ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: is_primary {
    type: yesno
    sql: ${TABLE}.is_primary = TRUE ;;
  }

  dimension_group: valid_from {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.valid_from ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: valid_to {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.valid_to ;;
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
    drill_fields: [id, created_date]
  }






}
