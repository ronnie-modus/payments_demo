# AUTO-GENERATED — payments_demo LookML project
view: invoice_card_payment_links {
  sql_table_name: `modus-playground.payments_demo.invoice_card_payment_links` ;;
  label: "Invoice Card Payment Links"
  view_label: "Invoice Card Payment Links"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoices.id"
  }

  dimension: public_url_token {
    type: string
    sql: ${TABLE}.public_url_token ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    group_label: "Status"
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.view_count ;;
    group_label: "Metrics"
  }

  dimension: converted_card_transaction_id {
    type: number
    sql: ${TABLE}.converted_card_transaction_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to card_transactions.id"
  }

  dimension: accepts_ach {
    type: yesno
    sql: ${TABLE}.accepts_ach = TRUE ;;
  }

  dimension: accepts_card {
    type: yesno
    sql: ${TABLE}.accepts_card = TRUE ;;
  }

  dimension: surcharge_percent {
    type: number
    sql: ${TABLE}.surcharge_percent ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expires_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: first_viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_viewed_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: converted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.converted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, status, created_date]
  }



  measure: sum_view_count {
    type: sum
    sql: ${TABLE}.view_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }



}
