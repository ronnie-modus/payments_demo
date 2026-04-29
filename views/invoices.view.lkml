# AUTO-GENERATED — payments_demo LookML project
view: invoices {
  sql_table_name: `modus-playground.payments_demo.invoices` ;;
  label: "Invoices"
  view_label: "Invoices"
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

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
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

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  dimension: accept_card_payments {
    type: yesno
    sql: ${TABLE}.accept_card_payments = TRUE ;;
  }

  dimension: card_payment_link_id {
    type: number
    sql: ${TABLE}.card_payment_link_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoice_card_payment_links.id"
  }

  dimension: send_method {
    type: string
    sql: ${TABLE}.send_method ;;
  }

  dimension: reminder_count {
    type: number
    sql: ${TABLE}.reminder_count ;;
    group_label: "Metrics"
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: sent_to_email {
    type: string
    sql: ${TABLE}.sent_to_email ;;
  }

  dimension: has_attachment {
    type: yesno
    sql: ${TABLE}.has_attachment = TRUE ;;
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

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sent_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.viewed_at ;;
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

  dimension_group: last_reminder_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_reminder_sent_at ;;
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
  measure: count_sent {
    type: count
    filters: [status: "sent"]
    label: "Count Sent"
    group_label: "Status Counts"
  }
  measure: count_viewed {
    type: count
    filters: [status: "viewed"]
    label: "Count Viewed"
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
  measure: count_written_off {
    type: count
    filters: [status: "written_off"]
    label: "Count Written Off"
    group_label: "Status Counts"
  }


  measure: sum_reminder_count {
    type: sum
    sql: ${TABLE}.reminder_count ;;
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
