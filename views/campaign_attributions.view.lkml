# AUTO-GENERATED — payments_demo LookML project
view: campaign_attributions {
  sql_table_name: `modus-playground.payments_demo.campaign_attributions` ;;
  label: "Campaign Attributions"
  view_label: "Campaign Attributions"
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

  dimension: marketing_campaign_id {
    type: number
    sql: ${TABLE}.marketing_campaign_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to marketing_campaigns.id"
  }

  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension_group: touchpoint {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.touchpoint_at ;;
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
