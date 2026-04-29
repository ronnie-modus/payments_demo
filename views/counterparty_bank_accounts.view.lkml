# AUTO-GENERATED — payments_demo LookML project
view: counterparty_bank_accounts {
  sql_table_name: `modus-playground.payments_demo.counterparty_bank_accounts` ;;
  label: "Counterparty Bank Accounts"
  view_label: "Counterparty Bank Accounts"
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

  dimension: account_holder_name {
    type: string
    sql: ${TABLE}.account_holder_name ;;
  }

  dimension: account_number_last4 {
    type: string
    sql: ${TABLE}.account_number_last4 ;;
  }

  dimension: account_number_hash {
    type: string
    sql: ${TABLE}.account_number_hash ;;
  }

  dimension: routing_number {
    type: string
    sql: ${TABLE}.routing_number ;;
  }

  dimension: swift_bic {
    type: string
    sql: ${TABLE}.swift_bic ;;
  }

  dimension: iban {
    type: string
    sql: ${TABLE}.iban ;;
  }

  dimension: bank_id {
    type: number
    sql: ${TABLE}.bank_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bank_lookup.id"
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: is_verified {
    type: yesno
    sql: ${TABLE}.is_verified = TRUE ;;
  }

  dimension: verification_method {
    type: string
    sql: ${TABLE}.verification_method ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active = TRUE ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: verified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.verified_at ;;
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

  dimension_group: deactivated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deactivated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }






}
