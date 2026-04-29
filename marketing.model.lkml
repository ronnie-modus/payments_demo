# ============================================================================
# MARKETING — campaigns, attribution, partnerships, network growth, email
# ============================================================================
# Owner: Growth & Marketing Analytics
# Audience: CMO, Demand Gen, Partnerships, Lifecycle Marketing
# Use this model for:
#   * Paid + organic campaign performance with multi-touch attribution
#   * Partnership channel ROI (hosted / integrated / local)
#   * Email engagement (sends, opens, clicks, bounces)
#   * Counterparty registry network growth & upsell-from-AR motion
#   * Customer health → marketing intervention loops
# ============================================================================

connection: "payments_demo"

include: "/views/*.view.lkml"

# ----------------------------------------------------------------------------
# Cache policies
# ----------------------------------------------------------------------------
datagroup: marketing_default {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "6 hours"
  description: "Default cache for marketing dashboards. 6h is a good balance for daily standups."
}

datagroup: marketing_daily {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "24 hours"
  description: "Daily refresh for cohort and attribution reports."
}


# ============================================================================
# EXPLORES
# ============================================================================

# ----------------------------------------------------------------------------
# Marketing Campaigns — paid + organic, with attribution and email linkage
# ----------------------------------------------------------------------------
explore: marketing_campaigns {
  label:        "Marketing Campaigns"
  description:  "Campaign performance with budget, spend, signups, conversions, and attribution touchpoints."
  group_label:  "Campaigns"
  persist_with: marketing_daily

  join: campaign_attributions {
    type:         left_outer
    sql_on:       ${marketing_campaigns.id} = ${campaign_attributions.marketing_campaign_id} ;;
    relationship: one_to_many
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${campaign_attributions.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: emails {
    type:         left_outer
    sql_on:       ${marketing_campaigns.id} = ${emails.linked_marketing_campaign_id} ;;
    relationship: one_to_many
  }

  join: owner_user {
    from:         users
    type:         left_outer
    sql_on:       ${marketing_campaigns.owner_user_id} = ${owner_user.id} ;;
    relationship: many_to_one
    view_label:   "Campaign Owner"
    fields:       [owner_user.id, owner_user.email, owner_user.first_name, owner_user.last_name, owner_user.department]
  }
}


# ----------------------------------------------------------------------------
# Partnerships — channel performance: hosted, integrated, local
# ----------------------------------------------------------------------------
explore: partnerships {
  label:        "Partnerships"
  description:  "Partner channels (hosted / integrated / local) with onboarded org volume, ARR contribution, and release linkage."
  group_label:  "Partnerships"
  persist_with: marketing_default

  join: organization_partnerships {
    type:         left_outer
    sql_on:       ${partnerships.id} = ${organization_partnerships.partnership_id} ;;
    relationship: one_to_many
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${organization_partnerships.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: releases {
    type:         left_outer
    sql_on:       ${partnerships.id} = ${releases.linked_partnership_id} ;;
    relationship: one_to_many
  }

  join: page_errors {
    type:         left_outer
    sql_on:       ${partnerships.id} = ${page_errors.linked_partnership_id} ;;
    relationship: one_to_many
    fields:       [page_errors.id, page_errors.error_type, page_errors.error_message, page_errors.occurred_date, page_errors.occurred_time, page_errors.count]
  }

  join: owner_user {
    from:         users
    type:         left_outer
    sql_on:       ${partnerships.owner_user_id} = ${owner_user.id} ;;
    relationship: many_to_one
    view_label:   "Partnership Owner"
    fields:       [owner_user.id, owner_user.email, owner_user.first_name, owner_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Emails — sends, opens, clicks, bounces, by audience type
# ----------------------------------------------------------------------------
explore: emails {
  label:        "Emails"
  description:  "Outbound email sends across transactional, lifecycle, marketing, and registry-upsell streams."
  group_label:  "Email"
  persist_with: marketing_default

  join: email_events {
    type:         left_outer
    sql_on:       ${emails.id} = ${email_events.email_id} ;;
    relationship: one_to_many
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${emails.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${emails.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: marketing_campaigns {
    type:         left_outer
    sql_on:       ${emails.linked_marketing_campaign_id} = ${marketing_campaigns.id} ;;
    relationship: many_to_one
  }

  join: registry_counterparties {
    type:         left_outer
    sql_on:       ${emails.registry_counterparty_id} = ${registry_counterparties.id} ;;
    relationship: many_to_one
    view_label:   "Registry Counterparty"
  }
}


# ----------------------------------------------------------------------------
# Registry Counterparties — network-effect growth from AR
# This is the upsell-from-the-network motion: a buyer pays a customer, the
# buyer becomes a registry_counterparty, then we email the buyer to convert
# them into a paying organization. Tracks the entire funnel.
# ----------------------------------------------------------------------------
explore: registry_counterparties {
  label:        "Registry Counterparties (Network Upsell)"
  description:  "Registry-of-counterparties network — buyers seen across multiple customers, and the upsell funnel from AR-network into paying orgs."
  group_label:  "Network Growth"
  persist_with: marketing_default

  join: counterparty_registry_mapping {
    type:         left_outer
    sql_on:       ${registry_counterparties.id} = ${counterparty_registry_mapping.registry_counterparty_id} ;;
    relationship: one_to_many
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${counterparty_registry_mapping.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
  }

  join: emails {
    type:         left_outer
    sql_on:       ${registry_counterparties.id} = ${emails.registry_counterparty_id} ;;
    relationship: one_to_many
  }

  join: page_errors {
    type:         left_outer
    sql_on:       ${registry_counterparties.id} = ${page_errors.registry_counterparty_id} ;;
    relationship: one_to_many
    fields:       [page_errors.id, page_errors.error_type, page_errors.error_message, page_errors.page_path, page_errors.occurred_date, page_errors.count]
  }

  join: linked_organization {
    from:         organizations
    type:         left_outer
    sql_on:       ${registry_counterparties.linked_organization_id} = ${linked_organization.id} ;;
    relationship: one_to_one
    view_label:   "Linked Org (Converted)"
  }

  join: countries {
    type:         left_outer
    sql_on:       ${registry_counterparties.canonical_country_id} = ${countries.id} ;;
    relationship: many_to_one
  }

  join: industries {
    type:         left_outer
    sql_on:       ${registry_counterparties.canonical_industry_id} = ${industries.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Customer Health Scores — for lifecycle marketing triggers
# ----------------------------------------------------------------------------
explore: customer_health_scores {
  label:        "Customer Health"
  description:  "Daily-snapshot health scores used to trigger lifecycle marketing interventions."
  group_label:  "Lifecycle"
  persist_with: marketing_default

  join: organizations {
    type:         left_outer
    sql_on:       ${customer_health_scores.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}
