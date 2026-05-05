- dashboard: subscription_lifecycle
  title: "Subscription Lifecycle"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "MRR movements, plan mix, upgrade/downgrade paths, and churn drivers. Refreshed daily."

  filters:
    - name: plan_tier
      title: "Plan Tier"
      type: field_filter
      model: finance_core
      explore: subscriptions
      field: plans.tier
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline

    - name: status
      title: "Subscription Status"
      type: field_filter
      model: finance_core
      explore: subscriptions
      field: subscriptions.status
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline

  elements:

    - title: "Active Subscriptions"
      name: kpi_active
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.count_active]
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Total MRR"
      name: kpi_mrr
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.total_mrr_usd]
      filters:
        subscriptions.status: "active,trialing,past_due"
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Trialing"
      name: kpi_trialing
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.count_trialing]
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Canceled (Period)"
      name: kpi_canceled
      model: finance_core
      explore: subscriptions
      type: single_value
      fields: [subscriptions.count_canceled]
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "MRR by Plan Tier (Monthly Trend)"
      name: mrr_by_plan_trend
      model: finance_core
      explore: subscriptions
      type: looker_line
      fields: [subscriptions.started_month, plans.tier, subscriptions.total_mrr_usd]
      pivots: [plans.tier]
      sorts: [subscriptions.started_month asc]
      filters:
        subscriptions.status: "active,trialing,past_due"
      row: 4
      col: 0
      width: 16
      height: 8

    - title: "Subscription Mix by Tier"
      name: subscription_mix
      model: finance_core
      explore: subscriptions
      type: looker_pie
      fields: [plans.tier, subscriptions.count_active]
      sorts: [subscriptions.count_active desc]
      row: 4
      col: 16
      width: 8
      height: 8

    - title: "Cancel Reason Breakdown"
      name: cancel_reasons
      model: finance_core
      explore: subscriptions
      type: looker_bar
      fields: [subscriptions.cancel_reason, subscriptions.count_canceled]
      filters:
        subscriptions.cancel_reason: "-NULL"
      sorts: [subscriptions.count_canceled desc]
      row: 12
      col: 0
      width: 12
      height: 8

    - title: "Renewal Count Distribution"
      name: renewal_distribution
      model: finance_core
      explore: subscriptions
      type: looker_column
      fields: [plans.tier, subscriptions.sum_renewal_count]
      filters:
        subscriptions.status: "active"
      sorts: [subscriptions.sum_renewal_count desc]
      listen:
        plan_tier: plans.tier
      row: 12
      col: 12
      width: 12
      height: 8

    - title: "Trial Conversion Funnel"
      name: trial_conversion
      model: finance_core
      explore: subscriptions
      type: looker_column
      fields: [subscriptions.status, subscriptions.count]
      sorts: [subscriptions.count desc]
      listen:
        plan_tier: plans.tier
      row: 20
      col: 0
      width: 8
      height: 8

    - title: "ARR by Partner Channel"
      name: arr_by_partner
      model: finance_core
      explore: subscriptions
      type: looker_bar
      fields: [organizations.partner_id, subscriptions.total_arr_usd]
      filters:
        subscriptions.status: "active,trialing,past_due"
      sorts: [subscriptions.total_arr_usd desc]
      limit: 10
      row: 20
      col: 8
      width: 8
      height: 8

    - title: "Avg MRR by Plan Tier"
      name: avg_mrr_by_plan
      model: finance_core
      explore: subscriptions
      type: looker_column
      fields: [plans.tier, subscriptions.total_mrr_usd]
      filters:
        subscriptions.status: "active"
      sorts: [subscriptions.total_mrr_usd desc]
      row: 20
      col: 16
      width: 8
      height: 8

    - title: "Subscriptions Starting vs Canceling by Month"
      name: starts_vs_cancels
      model: finance_core
      explore: subscriptions
      type: looker_column
      fields: [subscriptions.started_month, subscriptions.count, subscriptions.count_canceled]
      sorts: [subscriptions.started_month asc]
      listen:
        plan_tier: plans.tier
      row: 28
      col: 0
      width: 24
      height: 8
