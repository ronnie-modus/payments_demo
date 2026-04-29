# AUTO-GENERATED — payments_demo LookML project
view: csm_activities {
  sql_table_name: `modus-playground.payments_demo.csm_activities` ;;
  label: "Csm Activities"
  view_label: "Csm Activities"
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

  dimension: activity_type {
    type: string
    sql: ${TABLE}.activity_type ;;
  }

  dimension: duration_minutes {
    type: number
    sql: ${TABLE}.duration_minutes ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
    group_label: "Status"
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: linked_support_ticket_id {
    type: number
    sql: ${TABLE}.linked_support_ticket_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to support_tickets.id"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.activity_date ;;
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





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
