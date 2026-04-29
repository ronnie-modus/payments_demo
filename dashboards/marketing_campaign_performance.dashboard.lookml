- dashboard: marketing_campaign_performance
  title: "Marketing Campaign Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Campaign spend, signups, conversion to paid, and CAC by channel."

  filters:
    - name: channel
      title: "Channel"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: marketing_campaigns
      field: marketing_campaigns.channel

    - name: campaign_type
      title: "Campaign Type"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: marketing_campaigns
      field: marketing_campaigns.campaign_type

    - name: started_at_date
      title: "Started Date"
      type: field_filter
      default_value: "90 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: marketing_campaigns
      field: marketing_campaigns.started_at_date

  elements:

    - title: "Total Spend"
      name: kpi_total_spend
      model: marketing
      explore: marketing_campaigns
      type: single_value
      fields: [marketing_campaigns.total_spend_usd]
      listen:
        channel: marketing_campaigns.channel
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Signups"
      name: kpi_signups
      model: marketing
      explore: marketing_campaigns
      type: single_value
      fields: [marketing_campaigns.sum_signups_count]
      listen:
        channel: marketing_campaigns.channel
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Converted to Paid"
      name: kpi_converted
      model: marketing
      explore: marketing_campaigns
      type: single_value
      fields: [marketing_campaigns.sum_converted_to_paid_count]
      listen:
        channel: marketing_campaigns.channel
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg CAC"
      name: kpi_avg_cac
      model: marketing
      explore: marketing_campaigns
      type: single_value
      fields: [marketing_campaigns.total_cac_usd]
      listen:
        channel: marketing_campaigns.channel
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Spend by Channel"
      name: spend_by_channel
      model: marketing
      explore: marketing_campaigns
      type: looker_bar
      fields: [marketing_campaigns.channel, marketing_campaigns.total_spend_usd]
      sorts: [marketing_campaigns.total_spend_usd desc]
      listen:
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Conversion Funnel by Channel"
      name: conversion_by_channel
      model: marketing
      explore: marketing_campaigns
      type: looker_column
      fields:
        - marketing_campaigns.channel
        - marketing_campaigns.sum_signups_count
        - marketing_campaigns.sum_activated_count
        - marketing_campaigns.sum_converted_to_paid_count
      sorts: [marketing_campaigns.sum_signups_count desc]
      listen:
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Campaign Detail"
      name: campaign_detail
      model: marketing
      explore: marketing_campaigns
      type: table
      fields:
        - marketing_campaigns.name
        - marketing_campaigns.channel
        - marketing_campaigns.campaign_type
        - marketing_campaigns.budget_usd
        - marketing_campaigns.spend_usd
        - marketing_campaigns.signups_count
        - marketing_campaigns.activated_count
        - marketing_campaigns.converted_to_paid_count
        - marketing_campaigns.churned_within_90d_count
        - marketing_campaigns.cac_usd
      sorts: [marketing_campaigns.spend_usd desc]
      limit: 50
      listen:
        channel: marketing_campaigns.channel
        campaign_type: marketing_campaigns.campaign_type
        started_at_date: marketing_campaigns.started_at_date
      row: 12
      col: 0
      width: 24
      height: 10
