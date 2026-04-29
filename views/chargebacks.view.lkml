# AUTO-GENERATED — payments_demo LookML project
view: chargebacks {
  sql_table_name: `modus-playground.payments_demo.chargebacks` ;;
  label: "Chargebacks"
  view_label: "Chargebacks"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: card_transaction_id {
    type: number
    sql: ${TABLE}.card_transaction_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to card_transactions.id"
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

  dimension: dispute_amount {
    type: number
    sql: ${TABLE}.dispute_amount ;;
    value_format_name: decimal_2
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: reason_code {
    type: string
    sql: ${TABLE}.reason_code ;;
  }

  dimension: reason_category {
    type: string
    sql: ${TABLE}.reason_category ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
  }

  dimension: dispute_case_id {
    type: number
    sql: ${TABLE}.dispute_case_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to dispute_cases.id"
  }

  dimension: won_amount {
    type: number
    sql: ${TABLE}.won_amount ;;
    value_format_name: decimal_2
  }

  dimension: lost_amount {
    type: number
    sql: ${TABLE}.lost_amount ;;
    value_format_name: decimal_2
  }

  dimension: acquirer_reference {
    type: string
    sql: ${TABLE}.acquirer_reference ;;
  }

  dimension_group: received {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.received_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: respond_by {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.respond_by ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: responded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.responded_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: resolved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.resolved_at ;;
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
    drill_fields: [id, status, created_date]
  }


  measure: count_needs_response {
    type: count
    filters: [status: "needs_response"]
    label: "Count Needs Response"
    group_label: "Status Counts"
  }
  measure: count_under_review {
    type: count
    filters: [status: "under_review"]
    label: "Count Under Review"
    group_label: "Status Counts"
  }
  measure: count_lost {
    type: count
    filters: [status: "lost"]
    label: "Count Lost"
    group_label: "Status Counts"
  }
  measure: count_won {
    type: count
    filters: [status: "won"]
    label: "Count Won"
    group_label: "Status Counts"
  }
  measure: count_accepted {
    type: count
    filters: [status: "accepted"]
    label: "Count Accepted"
    group_label: "Status Counts"
  }




  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
