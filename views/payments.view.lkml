# AUTO-GENERATED — payments_demo LookML project
view: payments {
  sql_table_name: `modus-playground.payments_demo.payments` ;;
  label: "Payments"
  view_label: "Payments"
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

  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: payment_method_id {
    type: number
    sql: ${TABLE}.payment_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payment_methods.id"
  }

  dimension: delivery_method_id {
    type: number
    sql: ${TABLE}.delivery_method_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to delivery_methods.id"
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

  dimension: fx_conversion_id {
    type: number
    sql: ${TABLE}.fx_conversion_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to fx_conversions.id"
  }

  dimension: platform_fee_amount {
    type: number
    sql: ${TABLE}.platform_fee_amount ;;
    value_format_name: decimal_2
  }

  dimension: third_party_fee_amount {
    type: number
    sql: ${TABLE}.third_party_fee_amount ;;
    value_format_name: decimal_2
  }

  dimension: fx_margin_amount {
    type: number
    sql: ${TABLE}.fx_margin_amount ;;
    value_format_name: decimal_2
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: return_code {
    type: string
    sql: ${TABLE}.return_code ;;
  }

  dimension: reference_number {
    type: string
    sql: ${TABLE}.reference_number ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: processor_id {
    type: number
    sql: ${TABLE}.processor_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to processors.id"
  }

  dimension: processor_reference {
    type: string
    sql: ${TABLE}.processor_reference ;;
  }

  dimension: risk_review_required {
    type: yesno
    sql: ${TABLE}.risk_review_required = TRUE ;;
  }

  dimension: risk_decision {
    type: string
    sql: ${TABLE}.risk_decision ;;
  }

  dimension: sanctions_screening_id {
    type: number
    sql: ${TABLE}.sanctions_screening_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to sanctions_screenings.id"
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: approved_by_user_id {
    type: number
    sql: ${TABLE}.approved_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: initiated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.initiated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: scheduled_for {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_for ;;
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

  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.completed_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: failed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.failed_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
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


  measure: count_scheduled {
    type: count
    filters: [status: "scheduled"]
    label: "Count Scheduled"
    group_label: "Status Counts"
  }
  measure: count_initiated {
    type: count
    filters: [status: "initiated"]
    label: "Count Initiated"
    group_label: "Status Counts"
  }
  measure: count_processing {
    type: count
    filters: [status: "processing"]
    label: "Count Processing"
    group_label: "Status Counts"
  }
  measure: count_completed {
    type: count
    filters: [status: "completed"]
    label: "Count Completed"
    group_label: "Status Counts"
  }
  measure: count_failed {
    type: count
    filters: [status: "failed"]
    label: "Count Failed"
    group_label: "Status Counts"
  }
  measure: count_canceled {
    type: count
    filters: [status: "canceled"]
    label: "Count Canceled"
    group_label: "Status Counts"
  }
  measure: count_returned {
    type: count
    filters: [status: "returned"]
    label: "Count Returned"
    group_label: "Status Counts"
  }
  measure: count_refunded {
    type: count
    filters: [status: "refunded"]
    label: "Count Refunded"
    group_label: "Status Counts"
  }

  measure: total_amount_usd {
    type: sum
    sql: ${TABLE}.amount_usd ;;
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
