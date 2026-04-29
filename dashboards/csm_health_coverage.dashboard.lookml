- dashboard: csm_health_coverage
  title: "CSM Health & Coverage"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "CSM book of business, activity volume, and resulting customer health. Refreshed daily."

  filters:
    - name: csm
      title: "CSM"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: csm_assignments
      field: csm_user.email

    - name: segment
      title: "Segment"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: csm_assignments
      field: csm_assignments.segment

  elements:

    - title: "Active Assignments"
      name: kpi_active_assignments
      model: operations
      explore: csm_assignments
      type: single_value
      fields: [csm_assignments.count]
      filters:
        csm_assignments.unassigned_date: "NULL"
      listen:
        csm: csm_user.email
        segment: csm_assignments.segment
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "ARR Under Management"
      name: kpi_arr_managed
      model: operations
      explore: csm_assignments
      type: single_value
      fields: [csm_assignments.total_arr_at_assignment_usd]
      filters:
        csm_assignments.unassigned_date: "NULL"
      listen:
        csm: csm_user.email
        segment: csm_assignments.segment
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Activities Last 30 Days"
      name: kpi_activities_30d
      model: operations
      explore: csm_assignments
      type: single_value
      fields: [csm_activities.count]
      filters:
        csm_activities.activity_date: "30 days"
      listen:
        csm: csm_user.email
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg Health Score"
      name: kpi_avg_health
      model: operations
      explore: csm_assignments
      type: single_value
      fields: [customer_health_scores.average_health_score]
      filters:
        customer_health_scores.score_date: "7 days"
      listen:
        segment: csm_assignments.segment
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Health Distribution by CSM"
      name: health_by_csm
      model: operations
      explore: csm_assignments
      type: looker_column
      fields: [csm_user.email, customer_health_scores.health_band, organizations.count]
      pivots: [customer_health_scores.health_band]
      filters:
        csm_assignments.unassigned_date: "NULL"
        customer_health_scores.score_date: "7 days"
      sorts: [organizations.count desc]
      stacking: normal
      limit: 20
      listen:
        csm: csm_user.email
        segment: csm_assignments.segment
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Activity Mix by Type"
      name: activity_mix
      model: operations
      explore: csm_assignments
      type: looker_pie
      fields: [csm_activities.activity_type, csm_activities.count]
      filters:
        csm_activities.activity_date: "30 days"
      sorts: [csm_activities.count desc]
      listen:
        csm: csm_user.email
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Book of Business by CSM"
      name: book_of_business
      model: operations
      explore: csm_assignments
      type: table
      fields:
        - csm_user.first_name
        - csm_user.last_name
        - csm_assignments.count
        - csm_assignments.total_arr_at_assignment_usd
        - csm_activities.count
      filters:
        csm_assignments.unassigned_date: "NULL"
      sorts: [csm_assignments.total_arr_at_assignment_usd desc]
      limit: 50
      listen:
        segment: csm_assignments.segment
      row: 12
      col: 0
      width: 24
      height: 9
