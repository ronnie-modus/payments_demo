# AUTO-GENERATED — payments_demo LookML project
view: counterparties {
  sql_table_name: `modus-playground.payments_demo.counterparties` ;;
  label: "Counterparties"
  view_label: "Counterparties"
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

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  dimension: counterparty_type {
    type: string
    sql: ${TABLE}.counterparty_type ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }

  dimension: tax_id_country {
    type: string
    sql: ${TABLE}.tax_id_country ;;
  }

  dimension: tax_id_value {
    type: string
    sql: ${TABLE}.tax_id_value ;;
  }

  dimension: business_structure {
    type: string
    sql: ${TABLE}.business_structure ;;
  }

  dimension: industry_id {
    type: number
    sql: ${TABLE}.industry_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to industries.id"
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: default_payment_terms {
    type: string
    sql: ${TABLE}.default_payment_terms ;;
  }

  dimension: default_payment_method_id {
    type: number
    sql: ${TABLE}.default_payment_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payment_methods.id"
  }

  dimension: default_delivery_method_id {
    type: number
    sql: ${TABLE}.default_delivery_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to delivery_methods.id"
  }

  dimension: ar_total_received_usd {
    type: number
    sql: ${TABLE}.ar_total_received_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: ap_total_paid_usd {
    type: number
    sql: ${TABLE}.ap_total_paid_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: invoice_count {
    type: number
    sql: ${TABLE}.invoice_count ;;
    group_label: "Metrics"
  }

  dimension: bill_count {
    type: number
    sql: ${TABLE}.bill_count ;;
    group_label: "Metrics"
  }

  dimension: internal_notes {
    type: string
    sql: ${TABLE}.internal_notes ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}.risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: custom_field_1 {
    type: string
    sql: ${TABLE}.custom_field_1 ;;
  }

  dimension: custom_field_2 {
    type: string
    sql: ${TABLE}.custom_field_2 ;;
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: relationship_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.relationship_started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: relationship_ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.relationship_ended_at ;;
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

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, display_name, created_date]
  }


  measure: total_ar_total_received_usd {
    type: sum
    sql: ${TABLE}.ar_total_received_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_ap_total_paid_usd {
    type: sum
    sql: ${TABLE}.ap_total_paid_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_invoice_count {
    type: sum
    sql: ${TABLE}.invoice_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_bill_count {
    type: sum
    sql: ${TABLE}.bill_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }


  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
