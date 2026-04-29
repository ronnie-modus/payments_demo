# AUTO-GENERATED — payments_demo LookML project
view: users {
  sql_table_name: `modus-playground.payments_demo.users` ;;
  label: "Users"
  view_label: "Users"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: primary_organization_id {
    type: number
    sql: ${TABLE}.primary_organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: is_internal_user {
    type: yesno
    sql: ${TABLE}.is_internal_user = TRUE ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active = TRUE ;;
  }

  dimension: has_2fa_enabled {
    type: yesno
    sql: ${TABLE}.has_2fa_enabled = TRUE ;;
  }

  dimension: login_count_30d {
    type: number
    sql: ${TABLE}.login_count_30d ;;
  }

  dimension: login_count_90d {
    type: number
    sql: ${TABLE}.login_count_90d ;;
  }

  dimension: invited_by_user_id {
    type: number
    sql: ${TABLE}.invited_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: marketing_opt_in {
    type: yesno
    sql: ${TABLE}.marketing_opt_in = TRUE ;;
  }

  dimension: created_via {
    type: string
    sql: ${TABLE}.created_via ;;
  }

  dimension: sso_provider {
    type: string
    sql: ${TABLE}.sso_provider ;;
  }

  dimension_group: email_verified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.email_verified_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: phone_verified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.phone_verified_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: password_last_changed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.password_last_changed_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: last_login {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_login_at ;;
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

  dimension_group: onboarding_completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.onboarding_completed_at ;;
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






}
