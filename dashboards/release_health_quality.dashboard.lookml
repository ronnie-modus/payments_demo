- dashboard: release_health_quality
  title: "Release Health & Quality"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Release frequency, downstream support tickets, and post-release error rate."

  filters:
    - name: release_type
      title: "Release Type"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: releases
      field: releases.release_type

    - name: released_date
      title: "Released Date"
      type: field_filter
      default_value: "90 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: releases
      field: releases.released_date

  elements:

    - title: "Releases (Period)"
      name: kpi_releases
      model: product_analytics
      explore: releases
      type: single_value
      fields: [releases.count]
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Releases with Breaking Changes"
      name: kpi_breaking_changes
      model: product_analytics
      explore: releases
      type: single_value
      fields: [releases.count]
      filters:
        releases.has_breaking_changes_documented: "Yes"
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Linked Support Tickets"
      name: kpi_linked_tickets
      model: product_analytics
      explore: releases
      type: single_value
      fields: [support_tickets.count]
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Releases Missing Notes"
      name: kpi_missing_notes
      model: product_analytics
      explore: releases
      type: single_value
      fields: [releases.count]
      filters:
        releases.has_release_notes: "No"
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Release Cadence by Week"
      name: release_cadence
      model: product_analytics
      explore: releases
      type: looker_column
      fields: [releases.released_week, releases.release_type, releases.count]
      pivots: [releases.release_type]
      stacking: normal
      sorts: [releases.released_week asc]
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Tickets per Release"
      name: tickets_per_release
      model: product_analytics
      explore: releases
      type: looker_bar
      fields: [releases.version, support_tickets.count]
      sorts: [support_tickets.count desc]
      limit: 20
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Recent Releases Detail"
      name: releases_detail
      model: product_analytics
      explore: releases
      type: table
      fields:
        - releases.released_date
        - releases.version
        - releases.name
        - releases.release_type
        - releases.affected_areas
        - releases.has_breaking_changes_documented
        - releases.has_release_notes
        - owner_user.email
        - support_tickets.count
      sorts: [releases.released_date desc]
      limit: 50
      listen:
        release_type: releases.release_type
        released_date: releases.released_date
      row: 12
      col: 0
      width: 24
      height: 10
