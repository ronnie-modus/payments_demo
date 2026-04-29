# AUTO-GENERATED — payments_demo LookML project
view: ach_returns {
  sql_table_name: `modus-playground.payments_demo.ach_returns` ;;
  label: "Ach Returns"
  view_label: "Ach Returns"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: return_code {
    type: string
    sql: ${TABLE}.return_code ;;
  }

  dimension: return_reason {
    type: string
    sql: ${TABLE}.return_reason ;;
  }

  dimension: originating_dfi_id {
    type: string
    sql: ${TABLE}.originating_dfi_id ;;
  }

  dimension: receiving_dfi_id {
    type: string
    sql: ${TABLE}.receiving_dfi_id ;;
  }

  dimension: return_amount {
    type: number
    sql: ${TABLE}.return_amount ;;
    value_format_name: decimal_2
  }

  dimension: was_re_attempted {
    type: yesno
    sql: ${TABLE}.was_re_attempted = TRUE ;;
  }

  dimension: re_attempt_payment_id {
    type: number
    sql: ${TABLE}.re_attempt_payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension_group: return {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.return_date ;;
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
