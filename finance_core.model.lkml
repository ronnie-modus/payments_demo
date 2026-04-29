# ============================================================================
# FINANCE CORE — revenue, billing, payments, P&L
# ============================================================================
# Owner: Finance Analytics Team
# Audience: CFO, FP&A, RevOps, Billing Ops
# Use this model for:
#   * Revenue & MRR/ARR analysis (subscriptions, platform_invoices, rev rec)
#   * AP/AR operations (bills, invoices, payments)
#   * Card acquiring revenue & interchange margin (card_transactions, cogs)
#   * FX margin tracking (fx_conversions)
# ============================================================================

connection: "payments_demo"

include: "/views/*.view.lkml"

# ----------------------------------------------------------------------------
# Cache policies
# ----------------------------------------------------------------------------
# Daily refresh datagroup — most finance reports tolerate 24h staleness.
# A live finance team would point this at an actual `audit_log.updated_at` query.
# Persistence is commented out until a PDT writeback schema is set in Looker
# Admin > Connections > PDT Settings (per gotcha #15).
datagroup: finance_core_default {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "24 hours"
  description: "Default cache for finance core. Refreshes nightly."
}

datagroup: hourly_refresh {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "1 hour"
  description: "Hourly refresh — for live ops dashboards."
}


# ============================================================================
# Field-level + view-level visibility tied to a Looker user attribute.
# The user attributes must exist in Looker Admin > User Attributes before
# enforcement kicks in (per gotcha #20). Until then these grants are
# effectively no-ops — the LookML still validates.




# ============================================================================
# NAMED VALUE FORMATS — reusable across views and tiles
# ============================================================================

named_value_format: usd_millions {
  value_format: "$0.00,,\" M\""
}

named_value_format: usd_thousands {
  value_format: "$0.0,\" K\""
}

named_value_format: basis_points {
  value_format: "0\" bps\""
}


# ============================================================================
# EXPLORE: organizations — customer-centric revenue & subscription posture
# ============================================================================
explore: organizations {
  label:       "Organizations & Revenue"
  description: "Customer organizations with subscription, plan, health, and lifetime revenue context."
  group_label: "Revenue"
  persist_with: finance_core_default

  # Soft restriction: default to non-churned orgs for finance reporting.
  # Users can change the value, but cannot remove the filter entirely.
  always_filter: {
    filters: [organizations.account_status: "-churned"]
  }

  join: subscriptions {
    type:         left_outer
    sql_on:       ${organizations.id} = ${subscriptions.organization_id} ;;
    relationship: one_to_many
  }

  join: plans {
    type:         left_outer
    sql_on:       ${subscriptions.plan_id} = ${plans.id} ;;
    relationship: many_to_one
  }

  join: subscription_usage {
    type:         left_outer
    sql_on:       ${subscriptions.id} = ${subscription_usage.subscription_id} ;;
    relationship: one_to_many
    view_label:   "Usage"
  }

  join: countries {
    type:         left_outer
    sql_on:       ${organizations.country_id} = ${countries.id} ;;
    relationship: many_to_one
  }

  join: industries {
    type:         left_outer
    sql_on:       ${organizations.industry_id} = ${industries.id} ;;
    relationship: many_to_one
  }

  join: customer_health_scores {
    type:         left_outer
    sql_on:       ${organizations.id} = ${customer_health_scores.organization_id} ;;
    relationship: one_to_many
    view_label:   "Health"
  }

  join: csm_assignments {
    type:         left_outer
    sql_on:       ${organizations.id} = ${csm_assignments.organization_id} ;;
    relationship: one_to_many
  }

  join: platform_invoices {
    type:         left_outer
    sql_on:       ${organizations.id} = ${platform_invoices.organization_id} ;;
    relationship: one_to_many
    view_label:   "Platform Invoices"
  }

  join: revenue_recognition {
    type:         left_outer
    sql_on:       ${organizations.id} = ${revenue_recognition.organization_id} ;;
    relationship: one_to_many
    view_label:   "Revenue Recognition"
  }
}


# ============================================================================
# EXPLORE: bills — Accounts Payable
# ============================================================================
explore: bills {
  label:       "Bills (AP)"
  description: "Inbound bills with line items, approvals, OCR provenance, and payment allocations."
  group_label: "AP / AR"
  persist_with: finance_core_default

  join: bill_lines {
    type:         left_outer
    sql_on:       ${bills.id} = ${bill_lines.bill_id} ;;
    relationship: one_to_many
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${bills.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${bills.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: bill_approvals {
    type:         left_outer
    sql_on:       ${bills.id} = ${bill_approvals.bill_id} ;;
    relationship: one_to_many
  }

  join: bill_approval_workflows {
    type:         left_outer
    sql_on:       ${bills.approval_workflow_id} = ${bill_approval_workflows.id} ;;
    relationship: many_to_one
  }

  join: ocr_extractions {
    type:         left_outer
    sql_on:       ${bills.ocr_extraction_id} = ${ocr_extractions.id} ;;
    relationship: many_to_one
    view_label:   "OCR"
  }

  join: bill_payments {
    type:         left_outer
    sql_on:       ${bills.id} = ${bill_payments.bill_id} ;;
    relationship: one_to_many
  }

  join: payments {
    type:         left_outer
    sql_on:       ${bill_payments.payment_id} = ${payments.id} ;;
    relationship: many_to_one
  }
}


# ============================================================================
# EXPLORE: invoices — Accounts Receivable
# ============================================================================
explore: invoices {
  label:       "Invoices (AR)"
  description: "Outbound invoices with line items, hosted card-payment links, and payment allocations."
  group_label: "AP / AR"
  persist_with: finance_core_default

  join: invoice_lines {
    type:         left_outer
    sql_on:       ${invoices.id} = ${invoice_lines.invoice_id} ;;
    relationship: one_to_many
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${invoices.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${invoices.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: invoice_card_payment_links {
    type:         left_outer
    sql_on:       ${invoices.card_payment_link_id} = ${invoice_card_payment_links.id} ;;
    relationship: one_to_one
    view_label:   "Card Payment Link"
  }

  join: invoice_payments {
    type:         left_outer
    sql_on:       ${invoices.id} = ${invoice_payments.invoice_id} ;;
    relationship: one_to_many
  }

  join: payments {
    type:         left_outer
    sql_on:       ${invoice_payments.payment_id} = ${payments.id} ;;
    relationship: many_to_one
  }
}


# ============================================================================
# EXPLORE: payments — money movement (used for ops + finance recon)
# ============================================================================
explore: payments {
  label:       "Payments"
  description: "All money-movement records with funding source, delivery rail, FX, and processor routing."
  group_label: "Money Movement"
  persist_with: hourly_refresh

  join: organizations {
    type:         left_outer
    sql_on:       ${payments.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${payments.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
  }

  join: payment_methods {
    type:         left_outer
    sql_on:       ${payments.payment_method_id} = ${payment_methods.id} ;;
    relationship: many_to_one
    view_label:   "Funding Source"
  }

  join: delivery_methods {
    type:         left_outer
    sql_on:       ${payments.delivery_method_id} = ${delivery_methods.id} ;;
    relationship: many_to_one
    view_label:   "Delivery Rail"
  }

  join: payment_attempts {
    type:         left_outer
    sql_on:       ${payments.id} = ${payment_attempts.payment_id} ;;
    relationship: one_to_many
  }

  join: payment_status_history {
    type:         left_outer
    sql_on:       ${payments.id} = ${payment_status_history.payment_id} ;;
    relationship: one_to_many
  }

  join: fx_conversions {
    type:         left_outer
    sql_on:       ${payments.fx_conversion_id} = ${fx_conversions.id} ;;
    relationship: one_to_one
    view_label:   "FX Conversion"
  }

  join: processors {
    type:         left_outer
    sql_on:       ${payments.processor_id} = ${processors.id} ;;
    relationship: many_to_one
  }

  join: bill_payments {
    type:         left_outer
    sql_on:       ${payments.id} = ${bill_payments.payment_id} ;;
    relationship: one_to_many
    fields:       []   # join needed for filtering, but don't pollute the field picker
  }

  join: invoice_payments {
    type:         left_outer
    sql_on:       ${payments.id} = ${invoice_payments.payment_id} ;;
    relationship: one_to_many
    fields:       []
  }
}


# ============================================================================
# EXPLORE: card_transactions — card acquiring side
# ============================================================================
explore: card_transactions {
  label:       "Card Transactions"
  description: "Acquiring-side records: auths, captures, sales, refunds, voids, chargebacks. Joined to MCC for interchange analysis."
  group_label: "Money Movement"
  persist_with: hourly_refresh

  join: organizations {
    type:         left_outer
    sql_on:       ${card_transactions.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${card_transactions.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
    view_label:   "Buyer"
  }

  join: invoices {
    type:         left_outer
    sql_on:       ${card_transactions.invoice_id} = ${invoices.id} ;;
    relationship: many_to_one
  }

  join: invoice_card_payment_links {
    type:         left_outer
    sql_on:       ${card_transactions.card_payment_link_id} = ${invoice_card_payment_links.id} ;;
    relationship: many_to_one
    view_label:   "Card Payment Link"
  }

  join: chargebacks {
    type:         left_outer
    sql_on:       ${card_transactions.id} = ${chargebacks.card_transaction_id} ;;
    relationship: one_to_many
  }

  join: mcc_codes {
    type:         left_outer
    sql_on:       ${card_transactions.mcc_id} = ${mcc_codes.id} ;;
    relationship: many_to_one
    view_label:   "MCC"
  }

  join: processors {
    type:         left_outer
    sql_on:       ${card_transactions.processor_id} = ${processors.id} ;;
    relationship: many_to_one
  }
}


# ============================================================================
# EXPLORE: subscriptions — for revenue analytics
# ============================================================================
explore: subscriptions {
  label:       "Subscriptions & MRR"
  description: "Customer subscriptions, plan changes, and per-period usage rollups for usage-based billing."
  group_label: "Revenue"
  persist_with: finance_core_default

  join: organizations {
    type:         left_outer
    sql_on:       ${subscriptions.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: plans {
    type:         left_outer
    sql_on:       ${subscriptions.plan_id} = ${plans.id} ;;
    relationship: many_to_one
  }

  join: plan_features {
    type:         left_outer
    sql_on:       ${plans.id} = ${plan_features.plan_id} ;;
    relationship: one_to_many
  }

  join: subscription_usage {
    type:         left_outer
    sql_on:       ${subscriptions.id} = ${subscription_usage.subscription_id} ;;
    relationship: one_to_many
  }

  join: platform_invoices {
    type:         left_outer
    sql_on:       ${subscriptions.id} = ${platform_invoices.subscription_id} ;;
    relationship: one_to_many
  }
}


# ============================================================================
# EXPLORE: platform_invoices — what we bill our customers
# ============================================================================
explore: platform_invoices {
  label:       "Platform Invoices"
  description: "Invoices the platform sends to its customers (subscription + usage charges) plus revenue recognition entries."
  group_label: "Revenue"
  persist_with: finance_core_default


  join: organizations {
    type:         left_outer
    sql_on:       ${platform_invoices.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type:         left_outer
    sql_on:       ${platform_invoices.subscription_id} = ${subscriptions.id} ;;
    relationship: many_to_one
  }

  join: platform_invoice_lines {
    type:         left_outer
    sql_on:       ${platform_invoices.id} = ${platform_invoice_lines.platform_invoice_id} ;;
    relationship: one_to_many
  }

  join: revenue_recognition {
    type:         left_outer
    sql_on:       ${platform_invoices.id} = ${revenue_recognition.platform_invoice_id} ;;
    relationship: one_to_many
  }
}


# ============================================================================
# EXPLORE: cogs_entries — cost of revenue
# ============================================================================
explore: cogs_entries {
  label:       "COGS Entries"
  description: "Cost-of-goods entries: interchange, ACH fees, fraud and chargeback losses booked per transaction."
  group_label: "Revenue"
  persist_with: finance_core_default


  join: organizations {
    type:         left_outer
    sql_on:       ${cogs_entries.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: payments {
    type:         left_outer
    sql_on:       ${cogs_entries.linked_payment_id} = ${payments.id} ;;
    relationship: many_to_one
  }

  join: card_transactions {
    type:         left_outer
    sql_on:       ${cogs_entries.linked_card_transaction_id} = ${card_transactions.id} ;;
    relationship: many_to_one
  }

  join: chargebacks {
    type:         left_outer
    sql_on:       ${cogs_entries.linked_chargeback_id} = ${chargebacks.id} ;;
    relationship: many_to_one
  }

  join: processors {
    type:         left_outer
    sql_on:       ${cogs_entries.processor_id} = ${processors.id} ;;
    relationship: many_to_one
  }
}


# ============================================================================
# EXPLORE: fx_conversions — FX margin tracking
# ============================================================================
explore: fx_conversions {
  label:       "FX Conversions"
  description: "Per-payment FX conversion records with reference rate and margin tracking."
  group_label: "Money Movement"
  persist_with: finance_core_default

  join: payments {
    type:         left_outer
    sql_on:       ${fx_conversions.payment_id} = ${payments.id} ;;
    relationship: one_to_one
  }

  join: processors {
    type:         left_outer
    sql_on:       ${fx_conversions.processor_id} = ${processors.id} ;;
    relationship: many_to_one
  }
}
