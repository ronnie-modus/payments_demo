# AUTO-GENERATED — payments_demo LookML project
view: sanctions_screenings {
  sql_table_name: `modus-playground.payments_demo.sanctions_screenings` ;;
  label: "Sanctions Screenings"
  view_label: "Sanctions Screenings"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.target_type ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.target_id ;;
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

  dimension: screening_list_version {
    type: string
    sql: ${TABLE}.screening_list_version ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
    group_label: "Status"
  }

  dimension: match_score {
    type: number
    sql: ${TABLE}.match_score ;;
    value_format_name: percent_2
    group_label: "Metrics"
  }

  dimension: matched_list {
    type: string
    sql: ${TABLE}.matched_list ;;
  }

  dimension: reviewer_user_id {
    type: number
    sql: ${TABLE}.reviewer_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: review_outcome {
    type: string
    sql: ${TABLE}.review_outcome ;;
  }

  dimension: caused_payment_delay {
    type: yesno
    sql: ${TABLE}.caused_payment_delay = TRUE ;;
  }

  dimension: delay_seconds {
    type: number
    sql: ${TABLE}.delay_seconds ;;
    value_format_name: decimal_0
  }

  dimension_group: screened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.screened_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: reviewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reviewed_at ;;
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


  measure: count_clear {
    type: count
    filters: [outcome: "clear"]
    label: "Count Clear"
    group_label: "Status Counts"
  }
  measure: count_potential_match {
    type: count
    filters: [outcome: "potential_match"]
    label: "Count Potential Match"
    group_label: "Status Counts"
  }
  measure: count_confirmed_match {
    type: count
    filters: [outcome: "confirmed_match"]
    label: "Count Confirmed Match"
    group_label: "Status Counts"
  }



  measure: avg_delay_seconds {
    type: average
    sql: ${TABLE}.delay_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }

  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
