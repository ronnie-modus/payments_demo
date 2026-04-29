# AUTO-GENERATED — payments_demo LookML project
view: emails {
  sql_table_name: `modus-playground.payments_demo.emails` ;;
  label: "Emails"
  view_label: "Emails"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: email_type {
    type: string
    sql: ${TABLE}.email_type ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
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

  dimension: recipient_email {
    type: string
    sql: ${TABLE}.recipient_email ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: linked_invoice_id {
    type: number
    sql: ${TABLE}.linked_invoice_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to invoices.id"
  }

  dimension: linked_payment_id {
    type: number
    sql: ${TABLE}.linked_payment_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to payments.id"
  }

  dimension: linked_marketing_campaign_id {
    type: number
    sql: ${TABLE}.linked_marketing_campaign_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to marketing_campaigns.id"
  }

  dimension: send_status {
    type: string
    sql: ${TABLE}.send_status ;;
  }

  dimension: bounce_reason {
    type: string
    sql: ${TABLE}.bounce_reason ;;
  }

  dimension: opens_count {
    type: number
    sql: ${TABLE}.opens_count ;;
    group_label: "Metrics"
  }

  dimension: clicks_count {
    type: number
    sql: ${TABLE}.clicks_count ;;
    group_label: "Metrics"
  }

  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sent_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: first_opened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_opened_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: last_opened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_opened_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: first_clicked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_clicked_at ;;
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



  measure: sum_opens_count {
    type: sum
    sql: ${TABLE}.opens_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_clicks_count {
    type: sum
    sql: ${TABLE}.clicks_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }


  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
