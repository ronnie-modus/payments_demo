# ============================================================================
# OPERATIONS — customer success, support, onboarding, counterparty management
# ============================================================================
# Owner: Operations & CX Analytics Team
# Audience: COO, Head of CX, CSM org, Support leadership, Implementation team
# Use this model for:
#   * User & seat analysis (users, user_organizations, roles)
#   * Counterparty (vendor/customer) onboarding & enrichment
#   * Support ticket volume, sentiment, SLA, deflection
#   * CSM coverage, activities, and handoff quality
#   * OCR pipeline performance & correction rates
# ============================================================================

connection: "payments_demo"

include: "/views/*.view.lkml"

# ----------------------------------------------------------------------------
# Cache policies — ops dashboards are intra-day, so 1h cache is the default.
# Real-time queues (support backlog, fraud queue) bypass the cache entirely.
# ----------------------------------------------------------------------------
datagroup: ops_default {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "1 hour"
  description: "Default cache for operations dashboards. Hourly refresh."
}

datagroup: ops_daily {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "24 hours"
  description: "Daily cache for cohort / trend reports."
}


# ============================================================================
# ACCESS GRANTS
# ============================================================================
access_grant: can_view_pii {
  user_attribute: department
  allowed_values: ["cx", "support", "csm", "executive", "compliance"]
}

access_grant: can_view_internal_notes {
  user_attribute: department
  allowed_values: ["cx", "support", "csm", "executive"]
}


# ============================================================================
# EXPLORES
# ============================================================================

# ----------------------------------------------------------------------------
# Organizations — operational view (people, partnerships, sessions)
# Different lens than finance_core's "organizations" explore: this one focuses
# on activity/engagement rather than revenue.
# ----------------------------------------------------------------------------
explore: organizations {
  label:        "Organizations (Ops)"
  description:  "Customer organizations with people, partnership, and engagement context."
  group_label:  "Customers"
  persist_with: ops_default

  join: user_organizations {
    type:         left_outer
    sql_on:       ${organizations.id} = ${user_organizations.organization_id} ;;
    relationship: one_to_many
  }

  join: users {
    type:         left_outer
    sql_on:       ${user_organizations.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organization_partnerships {
    type:         left_outer
    sql_on:       ${organizations.id} = ${organization_partnerships.organization_id} ;;
    relationship: one_to_many
  }

  join: partnerships {
    type:         left_outer
    sql_on:       ${organization_partnerships.partnership_id} = ${partnerships.id} ;;
    relationship: many_to_one
  }

  join: csm_assignments {
    type:         left_outer
    sql_on:       ${organizations.id} = ${csm_assignments.organization_id} ;;
    relationship: one_to_many
  }

  join: customer_health_scores {
    type:         left_outer
    sql_on:       ${organizations.id} = ${customer_health_scores.organization_id} ;;
    relationship: one_to_many
  }

  join: industries {
    type:         left_outer
    sql_on:       ${organizations.industry_id} = ${industries.id} ;;
    relationship: many_to_one
  }

  join: countries {
    type:         left_outer
    sql_on:       ${organizations.country_id} = ${countries.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Users — identity, access, login behaviour
# ----------------------------------------------------------------------------
explore: users {
  label:        "Users"
  description:  "Platform users with org membership, roles, sessions, and login history."
  group_label:  "Customers"
  persist_with: ops_default

  required_access_grants: [can_view_pii]

  join: user_organizations {
    type:         left_outer
    sql_on:       ${users.id} = ${user_organizations.user_id} ;;
    relationship: one_to_many
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${user_organizations.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: user_roles {
    type:         left_outer
    sql_on:       ${users.id} = ${user_roles.user_id} ;;
    relationship: one_to_many
  }

  join: roles {
    type:         left_outer
    sql_on:       ${user_roles.role_id} = ${roles.id} ;;
    relationship: many_to_one
  }

  join: sessions {
    type:         left_outer
    sql_on:       ${users.id} = ${sessions.user_id} ;;
    relationship: one_to_many
  }

  join: api_keys {
    type:         left_outer
    sql_on:       ${users.id} = ${api_keys.created_by_user_id} ;;
    relationship: one_to_many
  }

  join: login_attempts {
    type:         left_outer
    sql_on:       ${users.id} = ${login_attempts.user_id} ;;
    relationship: one_to_many
  }
}


# ----------------------------------------------------------------------------
# Counterparties — vendors and customers, registry-enriched
# ----------------------------------------------------------------------------
explore: counterparties {
  label:        "Counterparties"
  description:  "Vendors and customers, with addresses, banking, payment preferences, and registry linkage."
  group_label:  "Counterparties"
  persist_with: ops_default

  join: organizations {
    type:         left_outer
    sql_on:       ${counterparties.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: counterparty_addresses {
    type:         left_outer
    sql_on:       ${counterparties.id} = ${counterparty_addresses.counterparty_id} ;;
    relationship: one_to_many
  }

  join: counterparty_bank_accounts {
    type:         left_outer
    sql_on:       ${counterparties.id} = ${counterparty_bank_accounts.counterparty_id} ;;
    relationship: one_to_many
  }

  join: counterparty_payment_preferences {
    type:         left_outer
    sql_on:       ${counterparties.id} = ${counterparty_payment_preferences.counterparty_id} ;;
    relationship: one_to_one
  }

  join: counterparty_registry_mapping {
    type:         left_outer
    sql_on:       ${counterparties.id} = ${counterparty_registry_mapping.counterparty_id} ;;
    relationship: one_to_one
  }

  join: registry_counterparties {
    type:         left_outer
    sql_on:       ${counterparty_registry_mapping.registry_counterparty_id} = ${registry_counterparties.id} ;;
    relationship: many_to_one
  }

  join: industries {
    type:         left_outer
    sql_on:       ${counterparties.industry_id} = ${industries.id} ;;
    relationship: many_to_one
  }

  join: countries {
    type:         left_outer
    sql_on:       ${counterparties.country_id} = ${countries.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Support tickets — CX volume, SLAs, sentiment, CSAT
# ----------------------------------------------------------------------------
explore: support_tickets {
  label:        "Support Tickets"
  description:  "Inbound support volume with SLAs, sentiment, CSAT, and release linkage."
  group_label:  "Support"
  persist_with: ops_default

  join: organizations {
    type:         left_outer
    sql_on:       ${support_tickets.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: created_by_user {
    from:         users
    type:         left_outer
    sql_on:       ${support_tickets.created_by_user_id} = ${created_by_user.id} ;;
    relationship: many_to_one
    view_label:   "Created By User"
    fields:       [created_by_user.id, created_by_user.email, created_by_user.first_name, created_by_user.last_name, created_by_user.job_title]
  }

  join: assigned_user {
    from:         users
    type:         left_outer
    sql_on:       ${support_tickets.assigned_user_id} = ${assigned_user.id} ;;
    relationship: many_to_one
    view_label:   "Assigned Agent"
    fields:       [assigned_user.id, assigned_user.email, assigned_user.first_name, assigned_user.last_name, assigned_user.department]
  }

  join: support_ticket_messages {
    type:         left_outer
    sql_on:       ${support_tickets.id} = ${support_ticket_messages.support_ticket_id} ;;
    relationship: one_to_many
  }

  join: releases {
    type:         left_outer
    sql_on:       ${support_tickets.linked_release_id} = ${releases.id} ;;
    relationship: many_to_one
    view_label:   "Linked Release"
  }
}


# ----------------------------------------------------------------------------
# CSM Assignments — coverage, activity, health
# ----------------------------------------------------------------------------
explore: csm_assignments {
  label:        "CSM Coverage"
  description:  "CSM-to-customer assignments, activities, and resulting health trends."
  group_label:  "Customer Success"
  persist_with: ops_default

  join: organizations {
    type:         left_outer
    sql_on:       ${csm_assignments.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: csm_user {
    from:         users
    type:         left_outer
    sql_on:       ${csm_assignments.csm_user_id} = ${csm_user.id} ;;
    relationship: many_to_one
    view_label:   "CSM"
  }

  join: csm_activities {
    type:         left_outer
    sql_on:       ${csm_assignments.organization_id} = ${csm_activities.organization_id}
                  AND ${csm_assignments.csm_user_id} = ${csm_activities.csm_user_id} ;;
    relationship: one_to_many
  }

  join: customer_health_scores {
    type:         left_outer
    sql_on:       ${csm_assignments.organization_id} = ${customer_health_scores.organization_id} ;;
    relationship: one_to_many
  }
}


# ----------------------------------------------------------------------------
# OCR Extractions — pipeline performance & correction rates
# ----------------------------------------------------------------------------
explore: ocr_extractions {
  label:        "OCR Pipeline"
  description:  "Bill OCR extractions with confidence scores, errors, and human corrections."
  group_label:  "Bills & Onboarding"
  persist_with: ops_daily

  join: organizations {
    type:         left_outer
    sql_on:       ${ocr_extractions.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: bills {
    type:         left_outer
    sql_on:       ${ocr_extractions.bill_id} = ${bills.id} ;;
    relationship: many_to_one
  }

  join: corrected_by_user {
    from:         users
    type:         left_outer
    sql_on:       ${ocr_extractions.corrected_by_user_id} = ${corrected_by_user.id} ;;
    relationship: many_to_one
    view_label:   "Corrected By User"
    fields:       [corrected_by_user.id, corrected_by_user.email, corrected_by_user.first_name, corrected_by_user.last_name]
  }
}
