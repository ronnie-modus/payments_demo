# AUTO-GENERATED — payments_demo LookML project
view: platform_invoices {
  sql_table_name: `modus-playground.payments_demo.platform_invoices` ;;
  label: "Platform Invoices"
  view_label: "Platform Invoices"
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

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to subscriptions.id"
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: subtotal_usd {
    type: number
    sql: ${TABLE}.subtotal_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: tax_usd {
    type: number
    sql: ${TABLE}.tax_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: total_usd {
    type: number
    sql: ${TABLE}.total_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: paid_usd {
    type: number
    sql: ${TABLE}.paid_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: payment_method_on_file_id {
    type: number
    sql: ${TABLE}.payment_method_on_file_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payment_methods.id"
  }

  dimension: dunning_attempts {
    type: number
    sql: ${TABLE}.dunning_attempts ;;
  }

  dimension_group: period_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_start ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: period_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_end ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: issue {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.issue_date ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.due_date ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: paid {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.paid_at ;;
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


  measure: count_draft {
    type: count
    filters: [status: "draft"]
    label: "Count Draft"
    group_label: "Status Counts"
  }
  measure: count_open {
    type: count
    filters: [status: "open"]
    label: "Count Open"
    group_label: "Status Counts"
  }
  measure: count_paid {
    type: count
    filters: [status: "paid"]
    label: "Count Paid"
    group_label: "Status Counts"
  }
  measure: count_past_due {
    type: count
    filters: [status: "past_due"]
    label: "Count Past Due"
    group_label: "Status Counts"
  }
  measure: count_void {
    type: count
    filters: [status: "void"]
    label: "Count Void"
    group_label: "Status Counts"
  }

  measure: total_subtotal_usd {
    type: sum
    sql: ${TABLE}.subtotal_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_tax_usd {
    type: sum
    sql: ${TABLE}.tax_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: sum_total_usd {
    type: sum
    sql: ${TABLE}.total_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_paid_usd {
    type: sum
    sql: ${TABLE}.paid_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_dunning_attempts {
    type: sum
    sql: ${TABLE}.dunning_attempts ;;
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
