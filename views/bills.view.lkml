# AUTO-GENERATED — payments_demo LookML project
view: bills {
  sql_table_name: `modus-playground.payments_demo.bills` ;;
  label: "Bills"
  view_label: "Bills"
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

  dimension: bill_number {
    type: string
    sql: ${TABLE}.bill_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format_name: decimal_2
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
    value_format_name: decimal_2
  }

  dimension: balance_amount {
    type: number
    sql: ${TABLE}.balance_amount ;;
    value_format_name: decimal_2
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
    value_format_name: decimal_2
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
    value_format_name: decimal_2
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: ocr_extraction_id {
    type: number
    sql: ${TABLE}.ocr_extraction_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to ocr_extractions.id"
  }

  dimension: accounting_sync_id {
    type: string
    sql: ${TABLE}.accounting_sync_id ;;
  }

  dimension: approval_workflow_id {
    type: number
    sql: ${TABLE}.approval_workflow_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bill_approval_workflows.id"
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

  dimension: gl_account_code {
    type: string
    sql: ${TABLE}.gl_account_code ;;
  }

  dimension: department_code {
    type: string
    sql: ${TABLE}.department_code ;;
  }

  dimension: project_code {
    type: string
    sql: ${TABLE}.project_code ;;
  }

  dimension: has_attachment {
    type: yesno
    sql: ${TABLE}.has_attachment = TRUE ;;
  }

  dimension: attachment_count {
    type: number
    sql: ${TABLE}.attachment_count ;;
    group_label: "Metrics"
  }

  dimension: is_recurring {
    type: yesno
    sql: ${TABLE}.is_recurring = TRUE ;;
  }

  dimension: recurring_template_id {
    type: number
    sql: ${TABLE}.recurring_template_id ;;
    hidden: yes
    value_format_name: id
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

  dimension_group: received {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.received_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.approved_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: paid {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.paid_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: canceled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.canceled_at ;;
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
    drill_fields: [id, status, created_date]
  }


  measure: count_draft {
    type: count
    filters: [status: "draft"]
    label: "Count Draft"
    group_label: "Status Counts"
  }
  measure: count_pending_approval {
    type: count
    filters: [status: "pending_approval"]
    label: "Count Pending Approval"
    group_label: "Status Counts"
  }
  measure: count_approved {
    type: count
    filters: [status: "approved"]
    label: "Count Approved"
    group_label: "Status Counts"
  }
  measure: count_scheduled {
    type: count
    filters: [status: "scheduled"]
    label: "Count Scheduled"
    group_label: "Status Counts"
  }
  measure: count_partially_paid {
    type: count
    filters: [status: "partially_paid"]
    label: "Count Partially Paid"
    group_label: "Status Counts"
  }
  measure: count_paid {
    type: count
    filters: [status: "paid"]
    label: "Count Paid"
    group_label: "Status Counts"
  }
  measure: count_overdue {
    type: count
    filters: [status: "overdue"]
    label: "Count Overdue"
    group_label: "Status Counts"
  }
  measure: count_canceled {
    type: count
    filters: [status: "canceled"]
    label: "Count Canceled"
    group_label: "Status Counts"
  }


  measure: sum_attachment_count {
    type: sum
    sql: ${TABLE}.attachment_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }


  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

  # ----- Amount sums (multi-currency: filter currency_code at query time) ----
  measure: total_amount_sum {
    type: sum
    sql: ${TABLE}.total_amount ;;
    value_format_name: decimal_2
    label: "Total Bill Amount"
    description: "Sum of total_amount. Filter currency_code to a single currency for a meaningful number."
    group_label: "Amounts"
  }

  measure: total_paid_sum {
    type: sum
    sql: ${TABLE}.paid_amount ;;
    value_format_name: decimal_2
    label: "Total Paid"
    description: "Sum of paid_amount. Filter currency_code at query time."
    group_label: "Amounts"
  }

  measure: total_balance_sum {
    type: sum
    sql: ${TABLE}.balance_amount ;;
    value_format_name: decimal_2
    label: "Total Unpaid AP Balance"
    description: "Sum of balance_amount. Filter currency_code at query time."
    group_label: "Amounts"
  }

}
