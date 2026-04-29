# AUTO-GENERATED — payments_demo LookML project
view: revenue_recognition {
  sql_table_name: `modus-playground.payments_demo.revenue_recognition` ;;
  label: "Revenue Recognition"
  view_label: "Revenue Recognition"
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

  dimension: platform_invoice_id {
    type: number
    sql: ${TABLE}.platform_invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to platform_invoices.id"
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to subscriptions.id"
  }

  dimension: recognition_type {
    type: string
    sql: ${TABLE}.recognition_type ;;
  }

  dimension: amount_usd {
    type: number
    sql: ${TABLE}.amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: revenue_category {
    type: string
    sql: ${TABLE}.revenue_category ;;
  }

  dimension: gl_account {
    type: string
    sql: ${TABLE}.gl_account ;;
  }

  dimension_group: recognition {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.recognition_date ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: period_covered_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_covered_start ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: period_covered_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.period_covered_end ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
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
