- dashboard: product_engagement_deep_dive
  title: "Product Engagement Deep Dive"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Session behaviour, page-level engagement, feature flag rollout, and browser/device breakdown."

  filters:
    - name: date_range
      title: "Date"
      type: field_filter
      model: product_analytics
      explore: sessions
      field: sessions.started_date
      default_value: "30 days"
      allow_multiple_values: false
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

    - name: account_status
      title: "Account Status"
      type: field_filter
      model: product_analytics
      explore: sessions
      field: organizations.account_status
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline

    - name: device_type
      title: "Device Type"
      type: field_filter
      model: product_analytics
      explore: sessions
      field: sessions.device_type
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline

  elements:

    - title: "Total Sessions"
      name: kpi_sessions
      model: product_analytics
      explore: sessions
      type: single_value
      fields: [sessions.count]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
        device_type: sessions.device_type
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Avg Session Duration (s)"
      name: kpi_avg_duration
      model: product_analytics
      explore: sessions
      type: single_value
      fields: [sessions.avg_duration_seconds]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
        device_type: sessions.device_type
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Total Events"
      name: kpi_events
      model: product_analytics
      explore: sessions
      type: single_value
      fields: [sessions.sum_event_count]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
        device_type: sessions.device_type
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Active Orgs in Session"
      name: kpi_active_orgs
      model: product_analytics
      explore: sessions
      type: single_value
      fields: [sessions.count_distinct_organizations]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Daily Sessions by Device Type"
      name: sessions_by_device
      model: product_analytics
      explore: sessions
      type: looker_column
      fields: [sessions.started_date, sessions.device_type, sessions.count]
      pivots: [sessions.device_type]
      sorts: [sessions.started_date asc]
      stacking: normal
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Sessions by Browser"
      name: sessions_by_browser
      model: product_analytics
      explore: sessions
      type: looker_bar
      fields: [sessions.browser, sessions.count]
      sorts: [sessions.count desc]
      limit: 10
      listen:
        date_range: sessions.started_date
        device_type: sessions.device_type
      row: 4
      col: 12
      width: 6
      height: 8

    - title: "Sessions by Auth Method"
      name: sessions_by_auth
      model: product_analytics
      explore: sessions
      type: looker_pie
      fields: [sessions.auth_method, sessions.count]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
      row: 4
      col: 18
      width: 6
      height: 8

    - title: "Top Pages by Views"
      name: top_pages
      model: product_analytics
      explore: page_views
      type: looker_bar
      fields: [page_views.page_path, page_views.count, page_views.avg_time_on_page_seconds]
      sorts: [page_views.count desc]
      limit: 15
      listen:
        date_range: page_views.viewed_date
      row: 12
      col: 0
      width: 12
      height: 9

    - title: "Page Views by Category (Error vs Clean)"
      name: error_pages
      model: product_analytics
      explore: page_views
      type: looker_column
      fields: [page_views.page_category, page_views.had_error, page_views.count]
      pivots: [page_views.had_error]
      stacking: normal
      sorts: [page_views.count desc]
      limit: 10
      listen:
        date_range: page_views.viewed_date
      row: 12
      col: 12
      width: 12
      height: 9

    - title: "Feature Flag Variant Distribution"
      name: flag_variants
      model: product_analytics
      explore: feature_flag_assignments
      type: looker_column
      fields: [feature_flags.flag_key, feature_flag_assignments.variant, feature_flag_assignments.count]
      pivots: [feature_flag_assignments.variant]
      sorts: [feature_flag_assignments.count desc]
      stacking: normal
      limit: 10
      row: 21
      col: 0
      width: 12
      height: 8

    - title: "Feature Flag Rollout by Plan"
      name: flag_by_plan
      model: product_analytics
      explore: feature_flag_assignments
      type: looker_bar
      fields: [organizations.account_status, feature_flag_assignments.count_distinct_organizations]
      sorts: [feature_flag_assignments.count_distinct_organizations desc]
      row: 21
      col: 12
      width: 12
      height: 8

    - title: "Session Ended Reason"
      name: ended_reason
      model: product_analytics
      explore: sessions
      type: looker_pie
      fields: [sessions.ended_reason, sessions.count]
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
      row: 29
      col: 0
      width: 8
      height: 8

    - title: "OS Distribution"
      name: os_distribution
      model: product_analytics
      explore: sessions
      type: looker_bar
      fields: [sessions.os, sessions.count]
      sorts: [sessions.count desc]
      limit: 10
      listen:
        date_range: sessions.started_date
        account_status: organizations.account_status
      row: 29
      col: 8
      width: 8
      height: 8

    - title: "Avg Scroll Depth by Page Category"
      name: scroll_depth
      model: product_analytics
      explore: page_views
      type: looker_column
      fields: [page_views.page_category, page_views.avg_time_on_page_seconds]
      sorts: [page_views.avg_time_on_page_seconds desc]
      limit: 10
      listen:
        date_range: page_views.viewed_date
      row: 29
      col: 16
      width: 8
      height: 8
