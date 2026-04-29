# AUTO-GENERATED — payments_demo LookML project
view: csm_assignments {
  sql_table_name: `modus-playground.payments_demo.csm_assignments` ;;
  label: "Csm Assignments"
  view_label: "Csm Assignments"
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

  dimension: csm_user_id {
    type: number
    sql: ${TABLE}.csm_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: is_primary {
    type: yesno
    sql: ${TABLE}.is_primary = TRUE ;;
  }

  dimension: arr_at_assignment_usd {
    type: number
    sql: ${TABLE}.arr_at_assignment_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension_group: assigned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.assigned_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: unassigned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.unassigned_at ;;
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


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }


  measure: total_arr_at_assignment_usd {
    type: sum
    sql: ${TABLE}.arr_at_assignment_usd ;;
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
