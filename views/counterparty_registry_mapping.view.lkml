# AUTO-GENERATED — payments_demo LookML project
view: counterparty_registry_mapping {
  sql_table_name: `modus-playground.payments_demo.counterparty_registry_mapping` ;;
  label: "Counterparty Registry Mapping"
  view_label: "Counterparty Registry Mapping"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: counterparty_id {
    type: number
    sql: ${TABLE}.counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to counterparties.id"
  }

  dimension: registry_counterparty_id {
    type: number
    sql: ${TABLE}.registry_counterparty_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to registry_counterparties.id"
  }

  dimension: match_confidence {
    type: number
    sql: ${TABLE}.match_confidence ;;
    value_format_name: percent_2
  }

  dimension: match_method {
    type: string
    sql: ${TABLE}.match_method ;;
  }

  dimension: matched_by {
    type: string
    sql: ${TABLE}.matched_by ;;
  }

  dimension: is_active_mapping {
    type: yesno
    sql: ${TABLE}.is_active_mapping = TRUE ;;
  }

  dimension_group: matched {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.matched_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id]
  }






}
