# AUTO-GENERATED — payments_demo LookML project
view: delivery_methods {
  sql_table_name: `modus-playground.payments_demo.delivery_methods` ;;
  label: "Delivery Methods"
  view_label: "Delivery Methods"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: rail {
    type: string
    sql: ${TABLE}.rail ;;
  }

  dimension: destination_bank_account_id {
    type: number
    sql: ${TABLE}.destination_bank_account_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparty_bank_accounts.id"
  }

  dimension: destination_card_last4 {
    type: string
    sql: ${TABLE}.destination_card_last4 ;;
  }

  dimension: destination_address_id {
    type: number
    sql: ${TABLE}.destination_address_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparty_addresses.id"
  }

  dimension: typical_arrival_days_min {
    type: number
    sql: ${TABLE}.typical_arrival_days_min ;;
    value_format_name: decimal_0
  }

  dimension: typical_arrival_days_max {
    type: number
    sql: ${TABLE}.typical_arrival_days_max ;;
    value_format_name: decimal_0
  }

  dimension: supports_currency_code {
    type: string
    sql: ${TABLE}.supports_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active = TRUE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
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
    drill_fields: [id, status, created_date]
  }





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
