- dashboard: security_audit_intelligence
  title: "Security & Audit Intelligence"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Login attempt patterns, audit log activity, API key usage, and account security health."

  filters:
    - name: date_range
      title: "Date"
      type: field_filter
      model: risk_compliance
      explore: login_attempts
      field: login_attempts.attempted_date
      default_value: "30 days"
      allow_multiple_values: false
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

    - name: outcome
      title: "Login Outcome"
      type: field_filter
      model: risk_compliance
      explore: login_attempts
      field: login_attempts.outcome
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline

  elements:

    - title: "Total Login Attempts"
      name: kpi_attempts
      model: risk_compliance
      explore: login_attempts
      type: single_value
      fields: [login_attempts.count]
      listen:
        date_range: login_attempts.attempted_date
        outcome: login_attempts.outcome
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Failed Logins"
      name: kpi_failed_logins
      model: risk_compliance
      explore: login_attempts
      type: single_value
      fields: [login_attempts.count]
      filters:
        login_attempts.outcome: "failed"
      listen:
        date_range: login_attempts.attempted_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Audit Log Events"
      name: kpi_audit_events
      model: risk_compliance
      explore: audit_log
      type: single_value
      fields: [audit_log.count]
      listen:
        date_range: audit_log.occurred_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Orgs with Login Activity"
      name: kpi_orgs_active
      model: risk_compliance
      explore: login_attempts
      type: single_value
      fields: [login_attempts.count_distinct_organizations]
      listen:
        date_range: login_attempts.attempted_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Login Outcomes Over Time"
      name: login_outcomes_trend
      model: risk_compliance
      explore: login_attempts
      type: looker_column
      fields: [login_attempts.attempted_date, login_attempts.outcome, login_attempts.count]
      pivots: [login_attempts.outcome]
      sorts: [login_attempts.attempted_date asc]
      stacking: normal
      listen:
        date_range: login_attempts.attempted_date
      row: 4
      col: 0
      width: 16
      height: 8

    - title: "Failure Reasons"
      name: failure_reasons
      model: risk_compliance
      explore: login_attempts
      type: looker_bar
      fields: [login_attempts.failure_reason, login_attempts.count]
      filters:
        login_attempts.outcome: "failed"
        login_attempts.failure_reason: "-NULL"
      sorts: [login_attempts.count desc]
      limit: 10
      listen:
        date_range: login_attempts.attempted_date
      row: 4
      col: 16
      width: 8
      height: 8

    - title: "Auth Method Distribution"
      name: auth_method_dist
      model: risk_compliance
      explore: login_attempts
      type: looker_pie
      fields: [login_attempts.auth_method, login_attempts.count]
      listen:
        date_range: login_attempts.attempted_date
        outcome: login_attempts.outcome
      row: 12
      col: 0
      width: 8
      height: 8

    - title: "Audit Events by Actor Type"
      name: audit_by_actor
      model: risk_compliance
      explore: audit_log
      type: looker_bar
      fields: [audit_log.actor_type, audit_log.count]
      sorts: [audit_log.count desc]
      listen:
        date_range: audit_log.occurred_date
      row: 12
      col: 8
      width: 8
      height: 8

    - title: "Top Audit Actions"
      name: top_audit_actions
      model: risk_compliance
      explore: audit_log
      type: looker_bar
      fields: [audit_log.action, audit_log.count]
      sorts: [audit_log.count desc]
      limit: 15
      listen:
        date_range: audit_log.occurred_date
      row: 12
      col: 16
      width: 8
      height: 8

    - title: "Audit Events by Target Type"
      name: audit_by_target
      model: risk_compliance
      explore: audit_log
      type: looker_column
      fields: [audit_log.target_type, audit_log.count]
      sorts: [audit_log.count desc]
      limit: 10
      listen:
        date_range: audit_log.occurred_date
      row: 20
      col: 0
      width: 12
      height: 8

    - title: "API Keys by Environment"
      name: api_keys_by_env
      model: operations
      explore: users
      type: looker_pie
      fields: [api_keys.environment, api_keys.count]
      sorts: [api_keys.count desc]
      row: 20
      col: 12
      width: 6
      height: 8

    - title: "API Keys by Scope"
      name: api_keys_by_scope
      model: operations
      explore: users
      type: looker_bar
      fields: [api_keys.scope, api_keys.count]
      sorts: [api_keys.count desc]
      limit: 10
      row: 20
      col: 18
      width: 6
      height: 8

    - title: "High-Risk Login Attempts"
      name: high_risk_logins
      model: risk_compliance
      explore: login_attempts
      type: table
      fields:
        - login_attempts.attempted_date
        - login_attempts.email_attempted
        - login_attempts.outcome
        - login_attempts.failure_reason
        - login_attempts.auth_method
        - login_attempts.ip_address
        - login_attempts.risk_score
      filters:
        login_attempts.outcome: "failed"
      sorts: [login_attempts.risk_score desc]
      limit: 50
      listen:
        date_range: login_attempts.attempted_date
      row: 28
      col: 0
      width: 24
      height: 10
