# AUTO-GENERATED — payments_demo LookML project
view: cogs_entries {
  sql_table_name: `modus-playground.payments_demo.cogs_entries` ;;
  label: "Cogs Entries"
  view_label: "Cogs Entries"
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

  dimension: linked_payment_id {
    type: number
    sql: ${TABLE}.linked_payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: linked_card_transaction_id {
    type: number
    sql: ${TABLE}.linked_card_transaction_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to card_transactions.id"
  }

  dimension: linked_chargeback_id {
    type: number
    sql: ${TABLE}.linked_chargeback_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to chargebacks.id"
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: amount_usd {
    type: number
    sql: ${TABLE}.amount_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: processor_id {
    type: number
    sql: ${TABLE}.processor_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to processors.id"
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: booked {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.booked_date ;;
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
