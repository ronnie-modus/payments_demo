# AUTO-GENERATED — payments_demo LookML project
view: card_transactions {
  sql_table_name: `modus-playground.payments_demo.card_transactions` ;;
  label: "Card Transactions"
  view_label: "Card Transactions"
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

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoices.id"
  }

  dimension: card_payment_link_id {
    type: number
    sql: ${TABLE}.card_payment_link_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoice_card_payment_links.id"
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: parent_transaction_id {
    type: number
    sql: ${TABLE}.parent_transaction_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to card_transactions.id"
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: decimal_2
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: amount_usd {
    type: number
    sql: ${TABLE}.amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: card_brand {
    type: string
    sql: ${TABLE}.card_brand ;;
  }

  dimension: card_last4 {
    type: string
    sql: ${TABLE}.card_last4 ;;
  }

  dimension: card_country {
    type: string
    sql: ${TABLE}.card_country ;;
  }

  dimension: card_funding_type {
    type: string
    sql: ${TABLE}.card_funding_type ;;
  }

  dimension: mcc_id {
    type: number
    sql: ${TABLE}.mcc_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to mcc_codes.id"
  }

  dimension: processor_id {
    type: number
    sql: ${TABLE}.processor_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to processors.id"
  }

  dimension: acquirer_reference {
    type: string
    sql: ${TABLE}.acquirer_reference ;;
  }

  dimension: auth_code {
    type: string
    sql: ${TABLE}.auth_code ;;
  }

  dimension: network_reference {
    type: string
    sql: ${TABLE}.network_reference ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
    group_label: "Status"
  }

  dimension: decline_code {
    type: string
    sql: ${TABLE}.decline_code ;;
  }

  dimension: decline_reason {
    type: string
    sql: ${TABLE}.decline_reason ;;
  }

  dimension: avs_result {
    type: string
    sql: ${TABLE}.avs_result ;;
  }

  dimension: cvv_result {
    type: string
    sql: ${TABLE}.cvv_result ;;
  }

  dimension: three_ds_status {
    type: string
    sql: ${TABLE}.three_ds_status ;;
  }

  dimension: three_ds_version {
    type: string
    sql: ${TABLE}.three_ds_version ;;
  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}.risk_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: risk_decision {
    type: string
    sql: ${TABLE}.risk_decision ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: device_fingerprint {
    type: string
    sql: ${TABLE}.device_fingerprint ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: interchange_amount {
    type: number
    sql: ${TABLE}.interchange_amount ;;
    value_format_name: usd_0
  }

  dimension: interchange_rate_bps {
    type: number
    sql: ${TABLE}.interchange_rate_bps ;;
    value_format: "0\" bps\""
  }

  dimension: platform_fee_amount {
    type: number
    sql: ${TABLE}.platform_fee_amount ;;
    value_format_name: usd_0
  }

  dimension: net_settlement_amount {
    type: number
    sql: ${TABLE}.net_settlement_amount ;;
    value_format_name: usd_0
  }

  dimension: settlement_batch_id {
    type: string
    sql: ${TABLE}.settlement_batch_id ;;
  }

  dimension_group: settled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.settled_at ;;
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

  dimension_group: processed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.processed_at ;;
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


  measure: count_approved {
    type: count
    filters: [outcome: "approved"]
    label: "Count Approved"
    group_label: "Status Counts"
  }
  measure: count_declined {
    type: count
    filters: [outcome: "declined"]
    label: "Count Declined"
    group_label: "Status Counts"
  }
  measure: count_pending {
    type: count
    filters: [outcome: "pending"]
    label: "Count Pending"
    group_label: "Status Counts"
  }

  measure: total_amount_usd {
    type: sum
    sql: ${TABLE}.amount_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_interchange_amount {
    type: sum
    sql: ${TABLE}.interchange_amount ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_platform_fee_amount {
    type: sum
    sql: ${TABLE}.platform_fee_amount ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_net_settlement_amount {
    type: sum
    sql: ${TABLE}.net_settlement_amount ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }



  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
