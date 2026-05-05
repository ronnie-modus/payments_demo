- dashboard: payment_flow_analysis
  title: "Payment Flow Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "End-to-end payment funnel: direction, rail, FX, fees, and timing. Refreshed hourly."

  filters:
    - name: date_range
      title: "Initiated Date"
      type: field_filter
      model: finance_core
      explore: payments
      field: payments.initiated_date
      default_value: "30 days"
      allow_multiple_values: false
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

    - name: direction
      title: "Direction"
      type: field_filter
      model: finance_core
      explore: payments
      field: payments.direction
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline

    - name: status
      title: "Status"
      type: field_filter
      model: finance_core
      explore: payments
      field: payments.status
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline

  elements:

    - title: "Total Payments"
      name: kpi_total_payments
      model: finance_core
      explore: payments
      type: single_value
      fields: [payments.count]
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
        status: payments.status
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Completed Payments"
      name: kpi_completed
      model: finance_core
      explore: payments
      type: single_value
      fields: [payments.count_completed]
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Failed Payments"
      name: kpi_failed
      model: finance_core
      explore: payments
      type: single_value
      fields: [payments.count_failed]
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Total Volume (USD)"
      name: kpi_volume
      model: finance_core
      explore: payments
      type: single_value
      fields: [payments.total_amount_usd]
      filters:
        payments.status: "completed"
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Daily Payment Volume by Status"
      name: daily_volume_by_status
      model: finance_core
      explore: payments
      type: looker_area
      fields: [payments.initiated_date, payments.status, payments.count]
      pivots: [payments.status]
      sorts: [payments.initiated_date asc]
      stacking: normal
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 4
      col: 0
      width: 16
      height: 8

    - title: "Payments by Direction"
      name: by_direction
      model: finance_core
      explore: payments
      type: looker_pie
      fields: [payments.direction, payments.count]
      listen:
        date_range: payments.initiated_date
        status: payments.status
      row: 4
      col: 16
      width: 8
      height: 8

    - title: "Volume by Currency"
      name: volume_by_currency
      model: finance_core
      explore: payments
      type: looker_bar
      fields: [payments.currency_code, payments.total_amount_usd]
      filters:
        payments.status: "completed"
      sorts: [payments.total_amount_usd desc]
      limit: 10
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 12
      col: 0
      width: 8
      height: 8

    - title: "Platform Fee Revenue (USD)"
      name: platform_fee_revenue
      model: finance_core
      explore: payments
      type: looker_line
      fields: [payments.initiated_month, payments.total_platform_fee_amount_usd]
      filters:
        payments.status: "completed"
      sorts: [payments.initiated_month asc]
      listen:
        direction: payments.direction
      row: 12
      col: 8
      width: 8
      height: 8

    - title: "FX Conversion Margin"
      name: fx_margin
      model: finance_core
      explore: fx_conversions
      type: looker_column
      fields: [fx_conversions.from_currency_code, fx_conversions.total_margin_amount_usd]
      sorts: [fx_conversions.total_margin_amount_usd desc]
      limit: 10
      row: 12
      col: 16
      width: 8
      height: 8

    - title: "Payments by Risk Decision"
      name: by_risk_decision
      model: finance_core
      explore: payments
      type: looker_column
      fields: [payments.risk_decision, payments.count, payments.total_amount_usd]
      sorts: [payments.count desc]
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
      row: 20
      col: 0
      width: 12
      height: 8

    - title: "ACH Returns by Return Code"
      name: ach_returns_by_code
      model: risk_compliance
      explore: ach_returns
      type: looker_bar
      fields: [ach_returns.return_code, ach_returns.count]
      sorts: [ach_returns.count desc]
      limit: 15
      row: 20
      col: 12
      width: 12
      height: 8

    - title: "Payment Detail"
      name: payment_detail
      model: finance_core
      explore: payments
      type: table
      fields:
        - payments.id
        - organizations.display_name
        - payments.direction
        - payments.status
        - payments.amount
        - payments.currency_code
        - payments.amount_usd
        - payments.platform_fee_amount
        - payments.risk_decision
        - payments.initiated_date
      sorts: [payments.initiated_date desc]
      limit: 50
      listen:
        date_range: payments.initiated_date
        direction: payments.direction
        status: payments.status
      row: 28
      col: 0
      width: 24
      height: 10
