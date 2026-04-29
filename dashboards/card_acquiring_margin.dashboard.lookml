- dashboard: card_acquiring_margin
  title: "Card Acquiring & Margin"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Card transaction volume, interchange cost, platform fees, and net merchant settlement margin."

  filters:
    - name: date_range
      title: "Transaction Date"
      type: field_filter
      default_value: "30 days"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      explore: card_transactions
      field: card_transactions.created_date

    - name: processor
      title: "Processor"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: card_transactions
      field: processors.name

  elements:

    - title: "Approved Transactions"
      name: kpi_approved_count
      model: finance_core
      explore: card_transactions
      type: single_value
      fields: [card_transactions.count_approved]
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Gross Volume"
      name: kpi_gross_volume
      model: finance_core
      explore: card_transactions
      type: single_value
      fields: [card_transactions.total_amount_usd]
      filters:
        card_transactions.status: "approved"
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Interchange Cost"
      name: kpi_interchange
      model: finance_core
      explore: card_transactions
      type: single_value
      fields: [card_transactions.total_interchange_amount]
      filters:
        card_transactions.status: "approved"
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Net Settlement (Platform Margin)"
      name: kpi_net_settlement
      model: finance_core
      explore: card_transactions
      type: single_value
      fields: [card_transactions.total_net_settlement_amount]
      filters:
        card_transactions.status: "approved"
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Daily Card Volume"
      name: daily_volume
      model: finance_core
      explore: card_transactions
      type: looker_area
      fields: [card_transactions.created_date, card_transactions.total_amount_usd]
      filters:
        card_transactions.status: "approved"
      sorts: [card_transactions.created_date asc]
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Approval Rate by Processor"
      name: approval_rate_by_processor
      model: finance_core
      explore: card_transactions
      type: looker_column
      fields: [processors.name, card_transactions.count_approved, card_transactions.count_declined]
      sorts: [card_transactions.count_approved desc]
      listen:
        date_range: card_transactions.created_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Volume by MCC Category"
      name: volume_by_mcc
      model: finance_core
      explore: card_transactions
      type: looker_bar
      fields: [mcc_codes.category, card_transactions.total_amount_usd]
      filters:
        card_transactions.status: "approved"
      sorts: [card_transactions.total_amount_usd desc]
      limit: 15
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 12
      col: 0
      width: 12
      height: 9

    - title: "Top Merchants"
      name: top_merchants
      model: finance_core
      explore: card_transactions
      type: table
      fields:
        - organizations.display_name
        - card_transactions.count_approved
        - card_transactions.total_amount_usd
        - card_transactions.total_interchange_amount
        - card_transactions.total_net_settlement_amount
      filters:
        card_transactions.status: "approved"
      sorts: [card_transactions.total_net_settlement_amount desc]
      limit: 25
      listen:
        date_range: card_transactions.created_date
        processor: processors.name
      row: 12
      col: 12
      width: 12
      height: 9
