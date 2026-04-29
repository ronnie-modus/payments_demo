# AUTO-GENERATED — payments_demo LookML project
view: registry_counterparties {
  sql_table_name: `modus-playground.payments_demo.registry_counterparties` ;;
  label: "Registry Counterparties"
  view_label: "Registry Counterparties"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: canonical_legal_name {
    type: string
    sql: ${TABLE}.canonical_legal_name ;;
  }

  dimension: canonical_tax_id_country {
    type: string
    sql: ${TABLE}.canonical_tax_id_country ;;
  }

  dimension: canonical_tax_id_value {
    type: string
    sql: ${TABLE}.canonical_tax_id_value ;;
  }

  dimension: canonical_country_id {
    type: number
    sql: ${TABLE}.canonical_country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: canonical_industry_id {
    type: number
    sql: ${TABLE}.canonical_industry_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to industries.id"
  }

  dimension: canonical_website_url {
    type: string
    sql: ${TABLE}.canonical_website_url ;;
  }

  dimension: canonical_email_domain {
    type: string
    sql: ${TABLE}.canonical_email_domain ;;
  }

  dimension: linked_organization_id {
    type: number
    sql: ${TABLE}.linked_organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: total_customers_transacting {
    type: number
    sql: ${TABLE}.total_customers_transacting ;;
  }

  dimension: total_payments_received_count {
    type: number
    sql: ${TABLE}.total_payments_received_count ;;
    group_label: "Metrics"
  }

  dimension: total_payments_received_usd {
    type: number
    sql: ${TABLE}.total_payments_received_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: total_chargeback_cases_linked {
    type: number
    sql: ${TABLE}.total_chargeback_cases_linked ;;
  }

  dimension: network_risk_score {
    type: number
    sql: ${TABLE}.network_risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: upsell_email_open_count {
    type: number
    sql: ${TABLE}.upsell_email_open_count ;;
    group_label: "Metrics"
  }

  dimension: upsell_email_click_count {
    type: number
    sql: ${TABLE}.upsell_email_click_count ;;
    group_label: "Metrics"
  }

  dimension: upsell_landing_page_view_count {
    type: number
    sql: ${TABLE}.upsell_landing_page_view_count ;;
    group_label: "Metrics"
  }

  dimension: upsell_landing_page_error_count {
    type: number
    sql: ${TABLE}.upsell_landing_page_error_count ;;
    group_label: "Metrics"
  }

  dimension_group: platform_registered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.platform_registered_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: first_seen_on_platform {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_seen_on_platform_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: last_activity {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_activity_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: upsell_email_first_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.upsell_email_first_sent_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: upsell_email_last_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.upsell_email_last_sent_at ;;
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


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }


  measure: sum_total_payments_received_usd {
    type: sum
    sql: ${TABLE}.total_payments_received_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_total_customers_transacting {
    type: sum
    sql: ${TABLE}.total_customers_transacting ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_total_payments_received_count {
    type: sum
    sql: ${TABLE}.total_payments_received_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_total_chargeback_cases_linked {
    type: sum
    sql: ${TABLE}.total_chargeback_cases_linked ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_upsell_email_open_count {
    type: sum
    sql: ${TABLE}.upsell_email_open_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_upsell_email_click_count {
    type: sum
    sql: ${TABLE}.upsell_email_click_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_upsell_landing_page_view_count {
    type: sum
    sql: ${TABLE}.upsell_landing_page_view_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_upsell_landing_page_error_count {
    type: sum
    sql: ${TABLE}.upsell_landing_page_error_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }



}
