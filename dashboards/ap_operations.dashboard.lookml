- dashboard: ap_operations
  title: "AP Operations Daily"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Bill backlog, approval pipeline, and scheduled disbursements. Refreshed hourly."

  filters:
    - name: organization
      title: "Organization"
      type: field_filter
      model: finance_core
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: bills
      field: organizations.display_name

    - name: bill_status
      title: "Bill Status"
      type: field_filter
      model: finance_core
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: bills
      field: bills.status

  elements:

    - title: "Bills Pending Approval"
      name: kpi_pending_approval
      model: finance_core
      explore: bills
      type: single_value
      fields: [bills.count_pending_approval]
      listen:
        organization: organizations.display_name
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Approved & Awaiting Payment"
      name: kpi_approved
      model: finance_core
      explore: bills
      type: single_value
      fields: [bills.count_approved]
      listen:
        organization: organizations.display_name
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Overdue Bills"
      name: kpi_overdue_bills
      model: finance_core
      explore: bills
      type: single_value
      fields: [bills.count_overdue]
      listen:
        organization: organizations.display_name
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "AP Backlog (USD)"
      name: kpi_ap_backlog
      model: finance_core
      explore: bills
      type: single_value
      fields: [bills.total_balance_sum]
      filters:
        bills.status: "pending_approval,approved,scheduled,partially_paid,overdue"
        bills.currency_code: "USD"
      listen:
        organization: organizations.display_name
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Bills by Status (Counts)"
      name: bills_by_status
      model: finance_core
      explore: bills
      type: looker_bar
      fields: [bills.status, bills.count]
      sorts: [bills.count desc]
      listen:
        organization: organizations.display_name
        bill_status: bills.status
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Bills Created vs Paid by Month"
      name: bills_created_vs_paid
      model: finance_core
      explore: bills
      type: looker_line
      fields: [bills.created_month, bills.count, bills.count_paid]
      sorts: [bills.created_month asc]
      listen:
        organization: organizations.display_name
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Bills by Approval Workflow"
      name: workflow_volume
      model: finance_core
      explore: bills
      type: looker_column
      fields: [bill_approval_workflows.name, bills.count]
      sorts: [bills.count desc]
      limit: 10
      listen:
        organization: organizations.display_name
      row: 12
      col: 0
      width: 12
      height: 8

    - title: "Top Vendors by Outstanding (USD)"
      name: top_vendors_outstanding
      model: finance_core
      explore: bills
      type: table
      fields:
        - counterparties.display_name
        - bills.count
        - bills.total_balance_sum
        - bills.count_overdue
      filters:
        bills.status: "pending_approval,approved,scheduled,partially_paid,overdue"
        bills.currency_code: "USD"
      sorts: [bills.total_balance_sum desc]
      limit: 25
      listen:
        organization: organizations.display_name
      row: 12
      col: 12
      width: 12
      height: 8
