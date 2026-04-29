# AUTO-GENERATED — payments_demo LookML project
view: bill_approval_workflows {
  sql_table_name: `modus-playground.payments_demo.bill_approval_workflows` ;;
  label: "Bill Approval Workflows"
  view_label: "Bill Approval Workflows"
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: trigger_amount_threshold_usd {
    type: number
    sql: ${TABLE}.trigger_amount_threshold_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: trigger_gl_account_codes {
    type: string
    sql: ${TABLE}.trigger_gl_account_codes ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: approval_steps_json {
    type: string
    sql: ${TABLE}.approval_steps_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active = TRUE ;;
  }

  dimension: created_by_user_id {
    type: number
    sql: ${TABLE}.created_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
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
    drill_fields: [id, name, created_date]
  }


  measure: total_trigger_amount_threshold_usd {
    type: sum
    sql: ${TABLE}.trigger_amount_threshold_usd ;;
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
