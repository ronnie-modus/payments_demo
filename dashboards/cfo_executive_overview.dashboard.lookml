- dashboard: cfo_executive_overview
  title: "CFO Executive Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Top-line revenue, payment volume, and platform P&L. Refreshed daily."

  filters:
    - name: date_range
      title: "Date Range"
      type: string_filter
      default_value: "30 days"
      allow_multiple_values: false
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

  elements:

    # ---------- KPI ROW ---------------------------------------------------
    - title: "Total ARR"
      name: kpi_arr
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.total_arr_usd]
      filters:
        subscriptions.status: "active,trialing"
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Active Subscriptions"
      name: kpi_active_subs
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.count_active]
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Payments Volume (Period)"
      name: kpi_payments_volume
      model: finance_core
      explore: payments
      type: single_value
      fields: [payments.total_amount_usd]
      filters:
        payments.status: "completed"
      listen:
        date_range: payments.created_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Card Net Settlement (Period)"
      name: kpi_card_net
      model: finance_core
      explore: card_transactions
      type: single_value
      fields: [card_transactions.total_net_settlement_amount]
      filters:
        card_transactions.outcome: "approved"
      listen:
        date_range: card_transactions.created_date
      row: 0
      col: 18
      width: 6
      height: 4

    # ---------- TREND ROW --------------------------------------------------
    - title: "MRR Trend by Plan"
      name: mrr_trend_by_plan
      model: finance_core
      explore: subscriptions
      type: looker_column
      fields: [subscriptions.created_month, plans.name, subscriptions.total_mrr_usd]
      pivots: [plans.name]
      sorts: [subscriptions.created_month asc]
      filters:
        subscriptions.status: "active,trialing,past_due"
      stacking: normal
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Payments Volume by Status"
      name: payments_volume_by_status
      model: finance_core
      explore: payments
      type: looker_line
      fields: [payments.created_date, payments.status, payments.count]
      pivots: [payments.status]
      sorts: [payments.created_date asc]
      listen:
        date_range: payments.created_date
      row: 4
      col: 12
      width: 12
      height: 8

    # ---------- DETAIL ROW -------------------------------------------------
    - title: "Top Customers by Lifetime Revenue"
      name: top_customers_by_revenue
      model: finance_core
      explore: organizations
      type: table
      fields:
        - organizations.display_name
        - organizations.account_status
        - plans.name
        - subscriptions.total_arr_usd
        - payments.total_amount_usd
      sorts: [payments.total_amount_usd desc]
      filters:
        payments.status: "completed"
      limit: 25
      row: 12
      col: 0
      width: 16
      height: 9

    - title: "AR Aging Snapshot"
      name: ar_aging_snapshot
      model: finance_core
      explore: invoices
      type: looker_pie
      fields: [invoices.status, invoices.count]
      filters:
        invoices.status: "sent,viewed,partially_paid,overdue"
      sorts: [invoices.count desc]
      row: 12
      col: 16
      width: 8
      height: 9
