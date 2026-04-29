# ============================================================================
# RISK & COMPLIANCE — fraud, KYC/KYB, sanctions, chargebacks, audit
# ============================================================================
# Owner: Risk & Compliance Team
# Audience: CRO, Head of Compliance, Fraud Ops, Disputes Team, Legal
# Use this model for:
#   * KYC/KYB onboarding funnel and step-level drop-off
#   * Real-time fraud scoring, queue depth, override rates
#   * Sanctions screening false-positive analysis
#   * Chargeback win-rate, dispute SLA, evidence quality
#   * ACH return rates by reason code
#   * Audit log forensics (who-did-what)
# ============================================================================
# Note: target_id columns on fraud_scores, fraud_review_queue, fraud_decisions,
# sanctions_screenings, risk_events, and audit_log are POLYMORPHIC — they can
# point at payments, users, organizations, sessions, etc. They are deliberately
# NOT auto-joined here. Analysts can write polymorphic joins on a case-by-case
# basis once they pick a target_type filter.
# ============================================================================

connection: "payments_demo"

include: "/views/*.view.lkml"

# ----------------------------------------------------------------------------
# Cache policies — risk dashboards need to be near-real-time. Default 15min.
# ----------------------------------------------------------------------------
datagroup: risk_default {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "15 minutes"
  description: "Default cache for risk dashboards — near-real-time."
}

datagroup: risk_daily {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "24 hours"
  description: "Daily cache for trend / cohort analyses."
}


# ============================================================================



# ============================================================================
# EXPLORES
# ============================================================================

# ----------------------------------------------------------------------------
# KYC / KYB Checks — onboarding compliance funnel
# ----------------------------------------------------------------------------
explore: kyc_kyb_checks {
  label:        "KYC / KYB Checks"
  description:  "Identity / business verification with step-level breakdown and reviewer outcomes."
  group_label:  "Onboarding Risk"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${kyc_kyb_checks.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: kyc_kyb_check_steps {
    type:         left_outer
    sql_on:       ${kyc_kyb_checks.id} = ${kyc_kyb_check_steps.kyc_kyb_check_id} ;;
    relationship: one_to_many
  }

  join: reviewer_user {
    from:         users
    type:         left_outer
    sql_on:       ${kyc_kyb_checks.reviewer_user_id} = ${reviewer_user.id} ;;
    relationship: many_to_one
    view_label:   "Reviewer"
    fields:       [reviewer_user.id, reviewer_user.email, reviewer_user.first_name, reviewer_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Fraud Scores — model output, override rates, queue handoff
# ----------------------------------------------------------------------------
explore: fraud_scores {
  label:        "Fraud Scores"
  description:  "ML fraud scores with rule-based triggers, decisions, and review queue handoff. target_id is polymorphic."
  group_label:  "Fraud"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${fraud_scores.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: fraud_review_queue {
    type:         left_outer
    sql_on:       ${fraud_scores.id} = ${fraud_review_queue.fraud_score_id} ;;
    relationship: one_to_one
  }

  join: fraud_decisions {
    type:         left_outer
    sql_on:       ${fraud_review_queue.id} = ${fraud_decisions.fraud_review_queue_id} ;;
    relationship: one_to_one
  }

  join: override_user {
    from:         users
    type:         left_outer
    sql_on:       ${fraud_scores.override_user_id} = ${override_user.id} ;;
    relationship: many_to_one
    view_label:   "Override Analyst"
    fields:       [override_user.id, override_user.email, override_user.first_name, override_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Fraud Review Queue — agent productivity, SLA breach, queue depth
# ----------------------------------------------------------------------------
explore: fraud_review_queue {
  label:        "Fraud Review Queue"
  description:  "Pending fraud cases, agent assignment, SLA, and resolution. target_id is polymorphic."
  group_label:  "Fraud"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${fraud_review_queue.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: fraud_scores {
    type:         left_outer
    sql_on:       ${fraud_review_queue.fraud_score_id} = ${fraud_scores.id} ;;
    relationship: many_to_one
  }

  join: fraud_decisions {
    type:         left_outer
    sql_on:       ${fraud_review_queue.id} = ${fraud_decisions.fraud_review_queue_id} ;;
    relationship: one_to_one
  }

  join: assigned_user {
    from:         users
    type:         left_outer
    sql_on:       ${fraud_review_queue.assigned_user_id} = ${assigned_user.id} ;;
    relationship: many_to_one
    view_label:   "Assigned Analyst"
    fields:       [assigned_user.id, assigned_user.email, assigned_user.first_name, assigned_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Sanctions Screenings — false-positive rates, payment-delay impact
# ----------------------------------------------------------------------------
explore: sanctions_screenings {
  label:        "Sanctions Screenings"
  description:  "OFAC / sanctions list screening with reviewer outcome and payment-delay impact. target_id is polymorphic."
  group_label:  "Compliance"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${sanctions_screenings.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: reviewer_user {
    from:         users
    type:         left_outer
    sql_on:       ${sanctions_screenings.reviewer_user_id} = ${reviewer_user.id} ;;
    relationship: many_to_one
    view_label:   "Reviewer"
    fields:       [reviewer_user.id, reviewer_user.email, reviewer_user.first_name, reviewer_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Chargebacks — dispute lifecycle, win rate, evidence quality
# ----------------------------------------------------------------------------
explore: chargebacks {
  label:        "Chargebacks"
  description:  "Card chargebacks with dispute case, evidence, network, and resolution."
  group_label:  "Disputes"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${chargebacks.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: counterparties {
    type:         left_outer
    sql_on:       ${chargebacks.counterparty_id} = ${counterparties.id} ;;
    relationship: many_to_one
    view_label:   "Buyer"
  }

  join: card_transactions {
    type:         left_outer
    sql_on:       ${chargebacks.card_transaction_id} = ${card_transactions.id} ;;
    relationship: many_to_one
  }

  join: dispute_cases {
    type:         left_outer
    sql_on:       ${chargebacks.dispute_case_id} = ${dispute_cases.id} ;;
    relationship: one_to_one
  }

  join: dispute_evidence {
    type:         left_outer
    sql_on:       ${dispute_cases.id} = ${dispute_evidence.dispute_case_id} ;;
    relationship: one_to_many
  }

  join: assigned_user {
    from:         users
    type:         left_outer
    sql_on:       ${dispute_cases.assigned_user_id} = ${assigned_user.id} ;;
    relationship: many_to_one
    view_label:   "Disputes Agent"
    fields:       [assigned_user.id, assigned_user.email, assigned_user.first_name, assigned_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# ACH Returns — return-code analysis, re-attempt success
# ----------------------------------------------------------------------------
explore: ach_returns {
  label:        "ACH Returns"
  description:  "ACH return events by NACHA return code, with re-attempt linkage."
  group_label:  "Payment Risk"
  persist_with: risk_daily

  join: payments {
    type:         left_outer
    sql_on:       ${ach_returns.payment_id} = ${payments.id} ;;
    relationship: many_to_one
  }

  join: re_attempt_payment {
    from:         payments
    type:         left_outer
    sql_on:       ${ach_returns.re_attempt_payment_id} = ${re_attempt_payment.id} ;;
    relationship: many_to_one
    view_label:   "Re-Attempt Payment"
    fields:       [re_attempt_payment.id, re_attempt_payment.status, re_attempt_payment.amount, re_attempt_payment.currency_code]
  }
}


# ----------------------------------------------------------------------------
# Risk Events — generic risk-signal log. target_id polymorphic.
# ----------------------------------------------------------------------------
explore: risk_events {
  label:        "Risk Events"
  description:  "Catch-all risk-signal log. target_id is polymorphic across many entities."
  group_label:  "Risk Signals"
  persist_with: risk_default

  join: organizations {
    type:         left_outer
    sql_on:       ${risk_events.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: resolved_by_user {
    from:         users
    type:         left_outer
    sql_on:       ${risk_events.resolved_by_user_id} = ${resolved_by_user.id} ;;
    relationship: many_to_one
    view_label:   "Resolved By"
    fields:       [resolved_by_user.id, resolved_by_user.email, resolved_by_user.first_name, resolved_by_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Audit Log — forensic who-did-what. Restricted by access_grant.
# ----------------------------------------------------------------------------
explore: audit_log {
  label:        "Audit Log"
  description:  "Per-action audit trail with actor, target, and before/after diff. target_id is polymorphic."
  group_label:  "Compliance"
  persist_with: risk_daily


  join: organizations {
    type:         left_outer
    sql_on:       ${audit_log.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: actor_user {
    from:         users
    type:         left_outer
    sql_on:       ${audit_log.actor_user_id} = ${actor_user.id} ;;
    relationship: many_to_one
    view_label:   "Actor"
  }

  join: actor_api_key {
    from:         api_keys
    type:         left_outer
    sql_on:       ${audit_log.actor_api_key_id} = ${actor_api_key.id} ;;
    relationship: many_to_one
    view_label:   "Actor API Key"
    fields:       [actor_api_key.id, actor_api_key.name, actor_api_key.key_prefix, actor_api_key.environment, actor_api_key.scope]
  }
}


# ----------------------------------------------------------------------------
# Login Attempts — credential stuffing / lockout analysis
# ----------------------------------------------------------------------------
explore: login_attempts {
  label:        "Login Attempts"
  description:  "Successful and failed logins with IP, outcome, failure reason, and risk score."
  group_label:  "Account Security"
  persist_with: risk_default

  join: users {
    type:         left_outer
    sql_on:       ${login_attempts.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${login_attempts.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}
