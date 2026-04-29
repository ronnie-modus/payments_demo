- dashboard: support_operations
  title: "Support Operations Daily"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Inbound ticket volume, SLA performance, agent productivity, and CSAT. Refreshed hourly."

  filters:
    - name: priority
      title: "Priority"
      type: field_filter
      model: operations
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: support_tickets
      field: support_tickets.priority

    - name: channel
      title: "Channel"
      type: field_filter
      model: operations
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: support_tickets
      field: support_tickets.channel

    - name: created_date
      title: "Created Date"
      type: field_filter
      model: operations
      default_value: "30 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: support_tickets
      field: support_tickets.created_date

  elements:

    - title: "Open Tickets"
      name: kpi_open_tickets
      model: operations
      explore: support_tickets
      type: single_value
      fields: [support_tickets.count]
      filters:
        support_tickets.status: "new,open,pending"
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "SLA Breached"
      name: kpi_sla_breached
      model: operations
      explore: support_tickets
      type: single_value
      fields: [support_tickets.count]
      filters:
        support_tickets.sla_breached: "Yes"
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Avg First-Response (s)"
      name: kpi_avg_first_response
      model: operations
      explore: support_tickets
      type: single_value
      fields: [support_tickets.avg_time_to_first_response_seconds]
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg Resolution (s)"
      name: kpi_avg_resolution
      model: operations
      explore: support_tickets
      type: single_value
      fields: [support_tickets.avg_time_to_resolution_seconds]
      filters:
        support_tickets.status: "resolved,closed"
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Daily Ticket Volume by Status"
      name: daily_volume_by_status
      model: operations
      explore: support_tickets
      type: looker_column
      fields: [support_tickets.created_date, support_tickets.status, support_tickets.count]
      pivots: [support_tickets.status]
      stacking: normal
      sorts: [support_tickets.created_date asc]
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Tickets by Category"
      name: tickets_by_category
      model: operations
      explore: support_tickets
      type: looker_bar
      fields: [support_tickets.category, support_tickets.count]
      sorts: [support_tickets.count desc]
      limit: 15
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Sentiment Mix"
      name: sentiment_mix
      model: operations
      explore: support_tickets
      type: looker_pie
      fields: [support_tickets.sentiment, support_tickets.count]
      sorts: [support_tickets.count desc]
      listen:
        priority: support_tickets.priority
        created_date: support_tickets.created_date
      row: 12
      col: 0
      width: 8
      height: 8

    - title: "Agent Productivity"
      name: agent_productivity
      model: operations
      explore: support_tickets
      type: table
      fields:
        - assigned_user.first_name
        - assigned_user.last_name
        - support_tickets.count
        - support_tickets.count_resolved
        - support_tickets.avg_time_to_first_response_seconds
        - support_tickets.avg_time_to_resolution_seconds
      filters:
        assigned_user.id: "NOT NULL"
      sorts: [support_tickets.count desc]
      limit: 25
      listen:
        priority: support_tickets.priority
        channel: support_tickets.channel
        created_date: support_tickets.created_date
      row: 12
      col: 8
      width: 16
      height: 8
