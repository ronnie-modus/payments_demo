- dashboard: chargebacks_disputes
  title: "Chargebacks & Disputes"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Card chargeback volume, win rate, dispute SLA, evidence quality, and team performance."

  filters:
    - name: network
      title: "Card Network"
      type: field_filter
      model: risk_compliance
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: chargebacks
      field: chargebacks.network

    - name: reason_category
      title: "Reason Category"
      type: field_filter
      model: risk_compliance
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: chargebacks
      field: chargebacks.reason_category

    - name: received_date
      title: "Received Date"
      type: field_filter
      model: risk_compliance
      default_value: "90 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: chargebacks
      field: chargebacks.received_date

  elements:

    - title: "Total Chargebacks"
      name: kpi_total_chargebacks
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [chargebacks.count]
      listen:
        network: chargebacks.network
        reason_category: chargebacks.reason_category
        received_date: chargebacks.received_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Won"
      name: kpi_won
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [chargebacks.count_won]
      listen:
        network: chargebacks.network
        reason_category: chargebacks.reason_category
        received_date: chargebacks.received_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Lost"
      name: kpi_lost
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [chargebacks.count_lost]
      listen:
        network: chargebacks.network
        reason_category: chargebacks.reason_category
        received_date: chargebacks.received_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "SLA Breached"
      name: kpi_sla_breached
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [dispute_cases.count]
      filters:
        dispute_cases.sla_breached: "Yes"
      listen:
        received_date: chargebacks.received_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Chargebacks by Reason Category"
      name: by_reason_category
      model: risk_compliance
      explore: chargebacks
      type: looker_bar
      fields: [chargebacks.reason_category, chargebacks.count]
      sorts: [chargebacks.count desc]
      listen:
        network: chargebacks.network
        received_date: chargebacks.received_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Outcome by Network"
      name: outcome_by_network
      model: risk_compliance
      explore: chargebacks
      type: looker_column
      fields: [chargebacks.network, chargebacks.resolution, chargebacks.count]
      pivots: [chargebacks.resolution]
      stacking: normal
      sorts: [chargebacks.count desc]
      listen:
        reason_category: chargebacks.reason_category
        received_date: chargebacks.received_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Disputes Pipeline"
      name: disputes_pipeline
      model: risk_compliance
      explore: chargebacks
      type: looker_column
      fields: [dispute_cases.status, dispute_cases.count]
      sorts: [dispute_cases.count desc]
      listen:
        received_date: chargebacks.received_date
      row: 12
      col: 0
      width: 8
      height: 8

    - title: "Avg Time to Submit Evidence (s)"
      name: time_to_submit
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [dispute_cases.avg_time_to_submit_seconds]
      filters:
        dispute_cases.status: "submitted,resolved"
      listen:
        received_date: chargebacks.received_date
      row: 12
      col: 8
      width: 8
      height: 4

    - title: "Avg Evidence Items per Case"
      name: avg_evidence_items
      model: risk_compliance
      explore: chargebacks
      type: single_value
      fields: [dispute_cases.sum_evidence_count]
      listen:
        received_date: chargebacks.received_date
      row: 16
      col: 8
      width: 8
      height: 4

    - title: "Top Dispute Agents"
      name: top_dispute_agents
      model: risk_compliance
      explore: chargebacks
      type: table
      fields:
        - assigned_user.first_name
        - assigned_user.last_name
        - dispute_cases.count
        - dispute_cases.count_resolved
        - dispute_cases.avg_time_to_first_touch_seconds
      filters:
        assigned_user.id: "NOT NULL"
      sorts: [dispute_cases.count desc]
      limit: 20
      listen:
        received_date: chargebacks.received_date
      row: 12
      col: 16
      width: 8
      height: 8
