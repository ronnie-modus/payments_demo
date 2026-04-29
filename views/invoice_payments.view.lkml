# AUTO-GENERATED — payments_demo LookML project
view: invoice_payments {
  sql_table_name: `modus-playground.payments_demo.invoice_payments` ;;
  label: "Invoice Payments"
  view_label: "Invoice Payments"
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

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: allocated_amount {
    type: number
    sql: ${TABLE}.allocated_amount ;;
    value_format_name: decimal_2
  }

  dimension: allocated_currency_code {
    type: string
    sql: ${TABLE}.allocated_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: allocation_order {
    type: number
    sql: ${TABLE}.allocation_order ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }






}
