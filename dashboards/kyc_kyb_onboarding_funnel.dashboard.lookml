- dashboard: kyc_kyb_onboarding_funnel
  title: "KYC / KYB Onboarding Funnel"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Identity verification step-by-step drop-off, provider performance, and reviewer outcomes."

  filters:
    - name: provider
      title: "Provider"
      type: field_filter
      model: risk_compliance
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: kyc_kyb_checks
      field: kyc_kyb_checks.provider

    - name: check_type
      title: "Check Type"
      type: field_filter
      model: risk_compliance
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: kyc_kyb_checks
      field: kyc_kyb_checks.check_type

    - name: started_date
      title: "Started Date"
      type: field_filter
      model: risk_compliance
      default_value: "30 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: kyc_kyb_checks
      field: kyc_kyb_checks.started_date

  elements:

    - title: "Checks Started"
      name: kpi_checks_started
      model: risk_compliance
      explore: kyc_kyb_checks
      type: single_value
      fields: [kyc_kyb_checks.count]
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Passed"
      name: kpi_passed
      model: risk_compliance
      explore: kyc_kyb_checks
      type: single_value
      fields: [kyc_kyb_checks.count_passed]
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Sent to Manual Review"
      name: kpi_manual_review
      model: risk_compliance
      explore: kyc_kyb_checks
      type: single_value
      fields: [kyc_kyb_checks.count_manual_review]
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg Duration (s)"
      name: kpi_avg_duration
      model: risk_compliance
      explore: kyc_kyb_checks
      type: single_value
      fields: [kyc_kyb_checks.avg_duration_seconds]
      filters:
        kyc_kyb_checks.status: "passed,failed,manual_review"
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Step-Level Drop-off"
      name: step_dropoff
      model: risk_compliance
      explore: kyc_kyb_checks
      type: looker_funnel
      fields: [kyc_kyb_check_steps.step_name, kyc_kyb_check_steps.count]
      sorts: [kyc_kyb_check_steps.count desc]
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 4
      col: 0
      width: 12
      height: 9

    - title: "Outcome by Provider"
      name: outcome_by_provider
      model: risk_compliance
      explore: kyc_kyb_checks
      type: looker_column
      fields: [kyc_kyb_checks.provider, kyc_kyb_checks.status, kyc_kyb_checks.count]
      pivots: [kyc_kyb_checks.status]
      sorts: [kyc_kyb_checks.count desc]
      stacking: normal
      listen:
        check_type: kyc_kyb_checks.check_type
        started_date: kyc_kyb_checks.started_date
      row: 4
      col: 12
      width: 12
      height: 9

    - title: "Failure Reasons"
      name: failure_reasons
      model: risk_compliance
      explore: kyc_kyb_checks
      type: looker_bar
      fields: [kyc_kyb_checks.failure_reason, kyc_kyb_checks.count]
      filters:
        kyc_kyb_checks.status: "failed,manual_review"
      sorts: [kyc_kyb_checks.count desc]
      limit: 12
      listen:
        provider: kyc_kyb_checks.provider
        started_date: kyc_kyb_checks.started_date
      row: 13
      col: 0
      width: 12
      height: 8

    - title: "Manual Review Backlog"
      name: manual_review_backlog
      model: risk_compliance
      explore: kyc_kyb_checks
      type: table
      fields:
        - kyc_kyb_checks.id
        - organizations.display_name
        - kyc_kyb_checks.check_type
        - kyc_kyb_checks.overall_risk_score
        - kyc_kyb_checks.failure_reason
        - kyc_kyb_checks.started_date
      filters:
        kyc_kyb_checks.status: "manual_review"
      sorts: [kyc_kyb_checks.overall_risk_score desc]
      limit: 50
      listen:
        provider: kyc_kyb_checks.provider
        check_type: kyc_kyb_checks.check_type
      row: 13
      col: 12
      width: 12
      height: 8
