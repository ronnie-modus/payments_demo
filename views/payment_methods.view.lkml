# AUTO-GENERATED — payments_demo LookML project
view: payment_methods {
  sql_table_name: `modus-playground.payments_demo.payment_methods` ;;
  label: "Payment Methods"
  view_label: "Payment Methods"
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

  dimension: method_type {
    type: string
    sql: ${TABLE}.method_type ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: bank_account_number_last4 {
    type: string
    sql: ${TABLE}.bank_account_number_last4 ;;
  }

  dimension: bank_routing_number {
    type: string
    sql: ${TABLE}.bank_routing_number ;;
  }

  dimension: bank_id {
    type: number
    sql: ${TABLE}.bank_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bank_lookup.id"
  }

  dimension: card_brand {
    type: string
    sql: ${TABLE}.card_brand ;;
  }

  dimension: card_last4 {
    type: string
    sql: ${TABLE}.card_last4 ;;
  }

  dimension: card_exp_month {
    type: number
    sql: ${TABLE}.card_exp_month ;;
  }

  dimension: card_exp_year {
    type: number
    sql: ${TABLE}.card_exp_year ;;
  }

  dimension: card_funding_type {
    type: string
    sql: ${TABLE}.card_funding_type ;;
  }

  dimension: card_country {
    type: string
    sql: ${TABLE}.card_country ;;
  }

  dimension: card_mcc {
    type: string
    sql: ${TABLE}.card_mcc ;;
  }

  dimension: is_default {
    type: yesno
    sql: ${TABLE}.is_default = TRUE ;;
  }

  dimension: is_verified {
    type: yesno
    sql: ${TABLE}.is_verified = TRUE ;;
  }

  dimension: verification_method {
    type: string
    sql: ${TABLE}.verification_method ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
    description: "Foreign key to currencies"
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
    drill_fields: [id, display_name, created_date]
  }





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
