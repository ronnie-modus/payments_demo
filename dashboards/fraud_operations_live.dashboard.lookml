- dashboard: fraud_operations_live
  title: "Fraud Operations Live"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Real-time fraud queue depth, score distribution, decision rates, and analyst override rates."

  filters:
    - name: target_type
      title: "Target Type"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: fraud_scores
      field: fraud_scores.target_type

    - name: created_date
      title: "Score Date"
      type: field_filter
      default_value: "7 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: fraud_scores
      field: fraud_scores.created_date

  elements:

    - title: "Scores Generated (Period)"
      name: kpi_scores_generated
      model: risk_compliance
      explore: fraud_scores
      type: single_value
      fields: [fraud_scores.count]
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Sent to Review"
      name: kpi_in_queue
      model: risk_compliance
      explore: fraud_scores
      type: single_value
      fields: [fraud_review_queue.count]
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Auto-Decline Rate"
      name: kpi_auto_decline
      model: risk_compliance
      explore: fraud_scores
      type: single_value
      fields: [fraud_scores.count]
      filters:
        fraud_scores.decision: "decline"
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Analyst Overrides"
      name: kpi_overrides
      model: risk_compliance
      explore: fraud_scores
      type: single_value
      fields: [fraud_scores.count]
      filters:
        fraud_scores.was_overridden: "Yes"
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Score Band Distribution"
      name: score_distribution
      model: risk_compliance
      explore: fraud_scores
      type: looker_column
      fields: [fraud_scores.score_band, fraud_scores.count]
      sorts: [fraud_scores.score_band asc]
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 4
      col: 0
      width: 8
      height: 8

    - title: "Decisions by Type"
      name: decisions_by_type
      model: risk_compliance
      explore: fraud_scores
      type: looker_pie
      fields: [fraud_scores.decision, fraud_scores.count]
      sorts: [fraud_scores.count desc]
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 4
      col: 8
      width: 8
      height: 8

    - title: "Velocity Signal: 24h Volume"
      name: velocity_signal
      model: risk_compliance
      explore: fraud_scores
      type: looker_line
      fields: [fraud_scores.created_date, fraud_scores.total_velocity_24h_amount_usd]
      sorts: [fraud_scores.created_date asc]
      listen:
        target_type: fraud_scores.target_type
        created_date: fraud_scores.created_date
      row: 4
      col: 16
      width: 8
      height: 8

    - title: "Active Review Queue"
      name: review_queue_table
      model: risk_compliance
      explore: fraud_review_queue
      type: table
      fields:
        - fraud_review_queue.id
        - fraud_review_queue.target_type
        - fraud_review_queue.priority
        - fraud_review_queue.status
        - fraud_review_queue.time_in_queue_seconds
        - assigned_user.email
        - organizations.display_name
      filters:
        fraud_review_queue.status: "open,in_review"
      sorts: [fraud_review_queue.priority asc, fraud_review_queue.time_in_queue_seconds desc]
      limit: 100
      row: 12
      col: 0
      width: 24
      height: 10
