- dashboard: page_errors_live
  title: "Page Errors Live"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Front-end error monitoring with release, partnership, and authentication-state context. Refreshed every 6 hours."

  filters:
    - name: error_type
      title: "Error Type"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: page_errors
      field: page_errors.error_type

    - name: occurred_date
      title: "Occurred Date"
      type: field_filter
      default_value: "7 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: page_errors
      field: page_errors.occurred_date

  elements:

    - title: "Errors (Period)"
      name: kpi_total_errors
      model: product_analytics
      explore: page_errors
      type: single_value
      fields: [page_errors.count]
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Affected Organizations"
      name: kpi_affected_orgs
      model: product_analytics
      explore: page_errors
      type: single_value
      fields: [page_errors.count_distinct_organizations]
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Errors on Anonymous Sessions"
      name: kpi_anon_errors
      model: product_analytics
      explore: page_errors
      type: single_value
      fields: [page_errors.count]
      filters:
        page_errors.user_was_authenticated: "No"
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Errors on First-Time Visitors"
      name: kpi_first_time_errors
      model: product_analytics
      explore: page_errors
      type: single_value
      fields: [page_errors.count]
      filters:
        page_errors.was_first_time_visitor: "Yes"
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Errors Over Time"
      name: errors_over_time
      model: product_analytics
      explore: page_errors
      type: looker_line
      fields: [page_errors.occurred_date, page_errors.error_type, page_errors.count]
      pivots: [page_errors.error_type]
      sorts: [page_errors.occurred_date asc]
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Errors by Browser"
      name: errors_by_browser
      model: product_analytics
      explore: page_errors
      type: looker_bar
      fields: [page_errors.browser, page_errors.count]
      sorts: [page_errors.count desc]
      limit: 10
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 4
      col: 12
      width: 6
      height: 8

    - title: "Errors by Linked Release"
      name: errors_by_release
      model: product_analytics
      explore: page_errors
      type: looker_bar
      fields: [releases.version, page_errors.count]
      sorts: [page_errors.count desc]
      limit: 10
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 4
      col: 18
      width: 6
      height: 8

    - title: "Top Page Paths with Errors"
      name: top_error_pages
      model: product_analytics
      explore: page_errors
      type: table
      fields:
        - page_errors.page_path
        - page_errors.error_type
        - page_errors.count
        - page_errors.count_distinct_organizations
      sorts: [page_errors.count desc]
      limit: 50
      listen:
        error_type: page_errors.error_type
        occurred_date: page_errors.occurred_date
      row: 12
      col: 0
      width: 24
      height: 10
