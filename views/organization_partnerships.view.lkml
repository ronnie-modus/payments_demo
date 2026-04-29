# AUTO-GENERATED — payments_demo LookML project
view: organization_partnerships {
  sql_table_name: `modus-playground.payments_demo.organization_partnerships` ;;
  label: "Organization Partnerships"
  view_label: "Organization Partnerships"
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

  dimension: partnership_id {
    type: number
    sql: ${TABLE}.partnership_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to partnerships.id"
  }

  dimension: is_primary {
    type: yesno
    sql: ${TABLE}.is_primary = TRUE ;;
  }

  dimension_group: relationship_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.relationship_started_at ;;
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





  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
