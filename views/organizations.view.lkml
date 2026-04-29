# AUTO-GENERATED — payments_demo LookML project
view: organizations {
  sql_table_name: `modus-playground.payments_demo.organizations` ;;
  label: "Organizations"
  view_label: "Organizations"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
    group_label: "Identity"
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
    group_label: "Identity"
  }

  dimension: industry_id {
    type: number
    sql: ${TABLE}.industry_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to industries.id"
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to countries.id"
  }

  dimension: state_or_region {
    type: string
    sql: ${TABLE}.state_or_region ;;
    group_label: "Address"
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Address"
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
    group_label: "Address"
  }

  dimension: address_line_1 {
    type: string
    sql: ${TABLE}.address_line_1 ;;
    group_label: "Address"
  }

  dimension: address_line_2 {
    type: string
    sql: ${TABLE}.address_line_2 ;;
    group_label: "Address"
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
    group_label: "Identity"
  }

  dimension: primary_contact_email {
    type: string
    sql: ${TABLE}.primary_contact_email ;;
    group_label: "Identity"
  }

  dimension: primary_contact_phone {
    type: string
    sql: ${TABLE}.primary_contact_phone ;;
    group_label: "Identity"
  }

  dimension: tax_id_country {
    type: string
    sql: ${TABLE}.tax_id_country ;;
    group_label: "Tax"
  }

  dimension: tax_id_value {
    type: string
    sql: ${TABLE}.tax_id_value ;;
    group_label: "Tax"
  }

  dimension: business_structure {
    type: string
    sql: ${TABLE}.business_structure ;;
    group_label: "Firmographics"
  }

  dimension: year_founded {
    type: number
    sql: ${TABLE}.year_founded ;;
    group_label: "Firmographics"
  }

  dimension: employee_count_band {
    type: string
    sql: ${TABLE}.employee_count_band ;;
    group_label: "Firmographics"
  }

  dimension: annual_revenue_band {
    type: string
    sql: ${TABLE}.annual_revenue_band ;;
    group_label: "Firmographics"
  }

  dimension: signup_source {
    type: string
    sql: ${TABLE}.signup_source ;;
    group_label: "Acquisition"
  }

  dimension: signup_campaign_id {
    type: number
    sql: ${TABLE}.signup_campaign_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to marketing_campaigns.id"
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to partnerships.id"
  }

  dimension: account_manager_user_id {
    type: number
    sql: ${TABLE}.account_manager_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: current_plan_id {
    type: number
    sql: ${TABLE}.current_plan_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to plans.id"
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}.account_status ;;
    group_label: "Lifecycle"
  }

  dimension: churn_reason {
    type: string
    sql: ${TABLE}.churn_reason ;;
    group_label: "Lifecycle"
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: default_currency_code {
    type: string
    sql: ${TABLE}.default_currency_code ;;
    description: "Foreign key to currencies"
  }

  dimension: has_ar_enabled {
    type: yesno
    sql: ${TABLE}.has_ar_enabled = TRUE ;;
    group_label: "Capabilities"
  }

  dimension: has_ap_enabled {
    type: yesno
    sql: ${TABLE}.has_ap_enabled = TRUE ;;
    group_label: "Capabilities"
  }

  dimension: has_card_acceptance_enabled {
    type: yesno
    sql: ${TABLE}.has_card_acceptance_enabled = TRUE ;;
    group_label: "Capabilities"
  }

  dimension: has_intl_payments_enabled {
    type: yesno
    sql: ${TABLE}.has_intl_payments_enabled = TRUE ;;
    group_label: "Capabilities"
  }

  dimension: has_fx_enabled {
    type: yesno
    sql: ${TABLE}.has_fx_enabled = TRUE ;;
    group_label: "Capabilities"
  }

  dimension: risk_tier {
    type: string
    sql: ${TABLE}.risk_tier ;;
    group_label: "Risk"
  }

  dimension: credit_limit_usd {
    type: number
    sql: ${TABLE}.credit_limit_usd ;;
    value_format_name: usd_0
    group_label: "Amounts"
  }

  dimension: internal_notes {
    type: string
    sql: ${TABLE}.internal_notes ;;
  }

  dimension: nps_score_latest {
    type: number
    sql: ${TABLE}.nps_score_latest ;;
  }

  dimension_group: plan_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.plan_started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: trial_ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trial_ended_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: activated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.activated_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: churned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.churned_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: nps_score_latest {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.nps_score_latest_at ;;
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

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, display_name, created_date]
  }


  measure: count_trial {
    type: count
    filters: [account_status: "trial"]
    label: "Count Trial"
    group_label: "Status Counts"
  }
  measure: count_active {
    type: count
    filters: [account_status: "active"]
    label: "Count Active"
    group_label: "Status Counts"
  }
  measure: count_past_due {
    type: count
    filters: [account_status: "past_due"]
    label: "Count Past Due"
    group_label: "Status Counts"
  }
  measure: count_suspended {
    type: count
    filters: [account_status: "suspended"]
    label: "Count Suspended"
    group_label: "Status Counts"
  }
  measure: count_churned {
    type: count
    filters: [account_status: "churned"]
    label: "Count Churned"
    group_label: "Status Counts"
  }

  measure: total_credit_limit_usd {
    type: sum
    sql: ${TABLE}.credit_limit_usd ;;
    value_format_name: usd_0
    group_label: "USD Totals"
  }




}
