# AUTO-GENERATED — payments_demo LookML project
view: marketing_campaigns {
  sql_table_name: `modus-playground.payments_demo.marketing_campaigns` ;;
  label: "Marketing Campaigns"
  view_label: "Marketing Campaigns"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: budget_usd {
    type: number
    sql: ${TABLE}.budget_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: spend_usd {
    type: number
    sql: ${TABLE}.spend_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: target_segment {
    type: string
    sql: ${TABLE}.target_segment ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: landing_page_url {
    type: string
    sql: ${TABLE}.landing_page_url ;;
  }

  dimension: signups_count {
    type: number
    sql: ${TABLE}.signups_count ;;
    group_label: "Metrics"
  }

  dimension: activated_count {
    type: number
    sql: ${TABLE}.activated_count ;;
    group_label: "Metrics"
  }

  dimension: converted_to_paid_count {
    type: number
    sql: ${TABLE}.converted_to_paid_count ;;
    group_label: "Metrics"
  }

  dimension: churned_within_90d_count {
    type: number
    sql: ${TABLE}.churned_within_90d_count ;;
    group_label: "Metrics"
  }

  dimension: cac_usd {
    type: number
    sql: ${TABLE}.cac_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: owner_user_id {
    type: number
    sql: ${TABLE}.owner_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension_group: started_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: ended_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
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
    drill_fields: [id, name, created_date]
  }


  measure: total_budget_usd {
    type: sum
    sql: ${TABLE}.budget_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_spend_usd {
    type: sum
    sql: ${TABLE}.spend_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }
  measure: total_cac_usd {
    type: sum
    sql: ${TABLE}.cac_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }

  measure: sum_signups_count {
    type: sum
    sql: ${TABLE}.signups_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_activated_count {
    type: sum
    sql: ${TABLE}.activated_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_converted_to_paid_count {
    type: sum
    sql: ${TABLE}.converted_to_paid_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_churned_within_90d_count {
    type: sum
    sql: ${TABLE}.churned_within_90d_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }



}
