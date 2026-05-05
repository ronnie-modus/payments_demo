- dashboard: unit_economics_cogs
  title: "Unit Economics & COGS"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Revenue recognition, cost-of-goods, and gross margin by cost type, processor, and cohort."

  filters:
    - name: month
      title: "Month"
      type: field_filter
      model: finance_core
      explore: cogs_entries
      field: cogs_entries.booked_month
      default_value: "12 months"
      allow_multiple_values: false
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

    - name: cost_type
      title: "Cost Type"
      type: field_filter
      model: finance_core
      explore: cogs_entries
      field: cogs_entries.cost_type
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline

  elements:

    - title: "Total Recognised Revenue (USD)"
      name: kpi_revenue
      model: finance_core
      explore: revenue_recognition
      type: single_value
      fields: [revenue_recognition.total_amount_usd]
      listen:
        month: revenue_recognition.recognition_month
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Total COGS (USD)"
      name: kpi_cogs
      model: finance_core
      explore: cogs_entries
      type: single_value
      fields: [cogs_entries.total_amount_usd]
      listen:
        month: cogs_entries.booked_month
        cost_type: cogs_entries.cost_type
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Revenue Entries"
      name: kpi_rev_entries
      model: finance_core
      explore: revenue_recognition
      type: single_value
      fields: [revenue_recognition.count]
      listen:
        month: revenue_recognition.recognition_month
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "COGS Entries"
      name: kpi_cogs_entries
      model: finance_core
      explore: cogs_entries
      type: single_value
      fields: [cogs_entries.count]
      listen:
        month: cogs_entries.booked_month
        cost_type: cogs_entries.cost_type
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Revenue by Category (Monthly)"
      name: revenue_by_category
      model: finance_core
      explore: revenue_recognition
      type: looker_area
      fields: [revenue_recognition.recognition_month, revenue_recognition.revenue_category, revenue_recognition.total_amount_usd]
      pivots: [revenue_recognition.revenue_category]
      sorts: [revenue_recognition.recognition_month asc]
      stacking: normal
      listen:
        month: revenue_recognition.recognition_month
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "COGS by Type (Monthly)"
      name: cogs_by_type
      model: finance_core
      explore: cogs_entries
      type: looker_area
      fields: [cogs_entries.booked_month, cogs_entries.cost_type, cogs_entries.total_amount_usd]
      pivots: [cogs_entries.cost_type]
      sorts: [cogs_entries.booked_month asc]
      stacking: normal
      listen:
        month: cogs_entries.booked_month
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Revenue by Recognition Type"
      name: rev_by_type
      model: finance_core
      explore: revenue_recognition
      type: looker_bar
      fields: [revenue_recognition.recognition_type, revenue_recognition.total_amount_usd]
      sorts: [revenue_recognition.total_amount_usd desc]
      listen:
        month: revenue_recognition.recognition_month
      row: 12
      col: 0
      width: 8
      height: 8

    - title: "COGS by Cost Type"
      name: cogs_breakdown
      model: finance_core
      explore: cogs_entries
      type: looker_pie
      fields: [cogs_entries.cost_type, cogs_entries.total_amount_usd]
      sorts: [cogs_entries.total_amount_usd desc]
      listen:
        month: cogs_entries.booked_month
      row: 12
      col: 8
      width: 8
      height: 8

    - title: "FX Margin by Currency Pair"
      name: fx_margin_pairs
      model: finance_core
      explore: fx_conversions
      type: looker_bar
      fields: [fx_conversions.from_currency_code, fx_conversions.total_margin_amount_usd]
      sorts: [fx_conversions.total_margin_amount_usd desc]
      limit: 10
      row: 12
      col: 16
      width: 8
      height: 8

    - title: "Platform Invoice Volume (Monthly)"
      name: platform_invoice_volume
      model: finance_core
      explore: platform_invoices
      type: looker_line
      fields: [platform_invoices.issue_month, platform_invoices.count, platform_invoices.count_paid]
      sorts: [platform_invoices.issue_month asc]
      row: 20
      col: 0
      width: 12
      height: 8

    - title: "Revenue by GL Account"
      name: rev_by_gl
      model: finance_core
      explore: revenue_recognition
      type: looker_bar
      fields: [revenue_recognition.gl_account, revenue_recognition.total_amount_usd]
      sorts: [revenue_recognition.total_amount_usd desc]
      limit: 10
      listen:
        month: revenue_recognition.recognition_month
      row: 20
      col: 12
      width: 12
      height: 8

    - title: "COGS by Org Count vs Amount"
      name: cogs_org_scatter
      model: finance_core
      explore: cogs_entries
      type: table
      fields:
        - cogs_entries.cost_type
        - cogs_entries.count
        - cogs_entries.total_amount_usd
        - cogs_entries.count_distinct_organizations
      sorts: [cogs_entries.total_amount_usd desc]
      listen:
        month: cogs_entries.booked_month
        cost_type: cogs_entries.cost_type
      row: 28
      col: 0
      width: 24
      height: 8
