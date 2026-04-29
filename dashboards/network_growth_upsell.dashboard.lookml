- dashboard: network_growth_upsell
  title: "Network Growth — AR-to-Payer Upsell"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Counterparty registry network growth and the upsell motion: paid-by buyer → emailed → landing page → converted to paying organization."

  filters:
    - name: country
      title: "Buyer Country"
      type: field_filter
      model: marketing
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: registry_counterparties
      field: countries.iso_alpha2

    - name: industry
      title: "Buyer Industry"
      type: field_filter
      model: marketing
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: dropdown_menu
        display: popover
      explore: registry_counterparties
      field: industries.name

  elements:

    - title: "Registry Counterparties"
      name: kpi_registry_size
      model: marketing
      explore: registry_counterparties
      type: single_value
      fields: [registry_counterparties.count]
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Total Network Volume"
      name: kpi_network_volume
      model: marketing
      explore: registry_counterparties
      type: single_value
      fields: [registry_counterparties.sum_total_payments_received_usd]
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Upsell Emails Opened"
      name: kpi_emails_opened
      model: marketing
      explore: registry_counterparties
      type: single_value
      fields: [registry_counterparties.sum_upsell_email_open_count]
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Upsell Landing Page Views"
      name: kpi_landing_views
      model: marketing
      explore: registry_counterparties
      type: single_value
      fields: [registry_counterparties.sum_upsell_landing_page_view_count]
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Network Growth by Month"
      name: network_growth
      model: marketing
      explore: registry_counterparties
      type: looker_area
      fields: [registry_counterparties.first_seen_on_platform_month, registry_counterparties.count]
      sorts: [registry_counterparties.first_seen_on_platform_month asc]
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Upsell Engagement Funnel"
      name: upsell_funnel
      model: marketing
      explore: registry_counterparties
      type: looker_column
      fields:
        - registry_counterparties.sum_upsell_email_open_count
        - registry_counterparties.sum_upsell_email_click_count
        - registry_counterparties.sum_upsell_landing_page_view_count
        - registry_counterparties.sum_upsell_landing_page_error_count
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Top Buyers by Network Volume"
      name: top_buyers
      model: marketing
      explore: registry_counterparties
      type: table
      fields:
        - registry_counterparties.canonical_legal_name
        - countries.iso_alpha2
        - industries.name
        - registry_counterparties.total_customers_transacting
        - registry_counterparties.total_payments_received_count
        - registry_counterparties.total_payments_received_usd
        - registry_counterparties.upsell_email_open_count
        - registry_counterparties.upsell_landing_page_view_count
      sorts: [registry_counterparties.total_payments_received_usd desc]
      limit: 50
      listen:
        country: countries.iso_alpha2
        industry: industries.name
      row: 12
      col: 0
      width: 24
      height: 10
