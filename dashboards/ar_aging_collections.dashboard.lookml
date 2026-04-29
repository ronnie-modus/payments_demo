- dashboard: ar_aging_collections
  title: "AR Aging & Collections"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Outstanding receivables, aging buckets, and collections team performance. Refreshed hourly."

  filters:
    - name: organization
      title: "Organization"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: invoices
      field: organizations.display_name

    - name: invoice_status
      title: "Invoice Status"
      type: field_filter
      default_value: "sent,viewed,partially_paid,overdue"
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: inline
      explore: invoices
      field: invoices.status

  elements:

    - title: "Open Invoices"
      name: kpi_open_invoices
      model: finance_core
      explore: invoices
      type: single_value
      fields: [invoices.count]
      filters:
        invoices.status: "sent,viewed,partially_paid,overdue"
      listen:
        organization: organizations.display_name
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Outstanding Balance (USD)"
      name: kpi_total_outstanding
      model: finance_core
      explore: invoices
      type: single_value
      fields: [invoices.total_balance_sum]
      filters:
        invoices.status: "sent,viewed,partially_paid,overdue"
        invoices.currency_code: "USD"
      listen:
        organization: organizations.display_name
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Overdue Invoices"
      name: kpi_overdue
      model: finance_core
      explore: invoices
      type: single_value
      fields: [invoices.count_overdue]
      listen:
        organization: organizations.display_name
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Total Reminders Sent"
      name: kpi_total_reminders
      model: finance_core
      explore: invoices
      type: single_value
      fields: [invoices.sum_reminder_count]
      filters:
        invoices.status: "sent,viewed,partially_paid,overdue"
      listen:
        organization: organizations.display_name
        invoice_status: invoices.status
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Open Balance by Status (USD)"
      name: aging_by_status
      model: finance_core
      explore: invoices
      type: looker_bar
      fields: [invoices.status, invoices.count, invoices.total_balance_sum]
      sorts: [invoices.total_balance_sum desc]
      filters:
        invoices.currency_code: "USD"
      listen:
        organization: organizations.display_name
        invoice_status: invoices.status
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Paid vs Sent by Month"
      name: paid_vs_sent
      model: finance_core
      explore: invoices
      type: looker_line
      fields: [invoices.created_month, invoices.count_paid, invoices.count_sent]
      sorts: [invoices.created_month asc]
      listen:
        organization: organizations.display_name
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Invoice Detail"
      name: invoice_detail
      model: finance_core
      explore: invoices
      type: table
      fields:
        - invoices.id
        - organizations.display_name
        - counterparties.display_name
        - invoices.status
        - invoices.due_date
        - invoices.total_amount
        - invoices.paid_amount
        - invoices.balance_amount
        - invoices.currency_code
        - invoices.reminder_count
      sorts: [invoices.due_date asc]
      limit: 100
      listen:
        organization: organizations.display_name
        invoice_status: invoices.status
      row: 12
      col: 0
      width: 24
      height: 10
