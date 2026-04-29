# ============================================================================
# PRODUCT ANALYTICS — UI events, page views, errors, releases, feature flags
# ============================================================================
# Owner: Product Analytics Team
# Audience: PMs, Eng leadership, Design, DevTools team
# Use this model for:
#   * Funnel & feature-adoption analysis (ui_events, page_views)
#   * Page-error / regression detection by release & by partnership surface
#   * Release impact analysis (release_notes, support_tickets, errors)
#   * Feature flag rollout monitoring (assignments, variant performance)
#   * Session-level engagement
# ============================================================================
# Note: ui_events is ~15M rows. Persist policy is daily, NOT 6h, because the
# refresh cost is non-trivial. For real-time dashboards, query the table
# directly with a date filter — explores below default to a recent window.
# ============================================================================

connection: "payments_demo"

include: "/views/*.view.lkml"
include: "/dashboards/release_health_quality.dashboard.lookml"
include: "/dashboards/page_errors_live.dashboard.lookml"

# ----------------------------------------------------------------------------
# Cache policies
# ----------------------------------------------------------------------------
datagroup: product_default {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "6 hours"
  description: "Default cache for product dashboards."
}

datagroup: product_daily {
  # sql_trigger: SELECT MAX(updated_at) FROM `modus-playground.payments_demo.audit_log` ;;
  max_cache_age: "24 hours"
  description: "Daily cache for high-volume tables (ui_events, page_views)."
}


# ============================================================================
# EXPLORES
# ============================================================================

# ----------------------------------------------------------------------------
# UI Events — primary event-stream explore. ~15M rows.
# Always_filter on a date is on the analyst — this view doesn't enforce one
# at the LookML level, but the ui_events.created_date dimension_group is the
# natural lever. Consider adding a sql_always_where in production.
# ----------------------------------------------------------------------------
explore: ui_events {
  label:        "UI Events"
  description:  "Click, view, error, and feature-interaction events. ~15M rows — filter on a date range."
  group_label:  "Event Stream"
  persist_with: product_daily

  join: sessions {
    type:         left_outer
    sql_on:       ${ui_events.session_id} = ${sessions.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${ui_events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${ui_events.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Page Views — pageview-grain stream with time-on-page, scroll depth
# ----------------------------------------------------------------------------
explore: page_views {
  label:        "Page Views"
  description:  "Per-pageview engagement: time on page, scroll depth, referrer, error flag."
  group_label:  "Event Stream"
  persist_with: product_daily

  join: sessions {
    type:         left_outer
    sql_on:       ${page_views.session_id} = ${sessions.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${page_views.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${page_views.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Page Errors — front-end error monitoring with release & partnership context
# ----------------------------------------------------------------------------
explore: page_errors {
  label:        "Page Errors"
  description:  "Front-end exceptions and JS errors with release / partnership / authentication context."
  group_label:  "Errors"
  persist_with: product_default

  join: sessions {
    type:         left_outer
    sql_on:       ${page_errors.session_id} = ${sessions.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${page_errors.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${page_errors.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: registry_counterparties {
    type:         left_outer
    sql_on:       ${page_errors.registry_counterparty_id} = ${registry_counterparties.id} ;;
    relationship: many_to_one
    view_label:   "Registry Counterparty (Upsell Page)"
  }

  join: releases {
    type:         left_outer
    sql_on:       ${page_errors.linked_release_id} = ${releases.id} ;;
    relationship: many_to_one
    view_label:   "Linked Release"
  }

  join: partnerships {
    type:         left_outer
    sql_on:       ${page_errors.linked_partnership_id} = ${partnerships.id} ;;
    relationship: many_to_one
    view_label:   "Linked Partnership Surface"
  }
}


# ----------------------------------------------------------------------------
# Releases — release impact: notes, flags, support tickets, partnerships
# ----------------------------------------------------------------------------
explore: releases {
  label:        "Releases"
  description:  "Code releases with notes, linked feature flags, downstream support tickets, and partnership rollout."
  group_label:  "Releases"
  persist_with: product_default

  join: release_notes {
    type:         left_outer
    sql_on:       ${releases.id} = ${release_notes.release_id} ;;
    relationship: one_to_many
  }

  join: feature_flags {
    type:         left_outer
    sql_on:       ${releases.feature_flag_id} = ${feature_flags.id} ;;
    relationship: many_to_one
  }

  join: support_tickets {
    type:         left_outer
    sql_on:       ${releases.id} = ${support_tickets.linked_release_id} ;;
    relationship: one_to_many
  }

  join: partnerships {
    type:         left_outer
    sql_on:       ${releases.linked_partnership_id} = ${partnerships.id} ;;
    relationship: many_to_one
  }

  join: owner_user {
    from:         users
    type:         left_outer
    sql_on:       ${releases.owner_user_id} = ${owner_user.id} ;;
    relationship: many_to_one
    view_label:   "Release Owner"
    fields:       [owner_user.id, owner_user.email, owner_user.first_name, owner_user.last_name, owner_user.department]
  }
}


# ----------------------------------------------------------------------------
# Feature Flags — rollout monitoring & variant analysis
# ----------------------------------------------------------------------------
explore: feature_flags {
  label:        "Feature Flags"
  description:  "Feature flag definitions, rollout strategies, assignments, and release linkage."
  group_label:  "Feature Flags"
  persist_with: product_default

  join: feature_flag_assignments {
    type:         left_outer
    sql_on:       ${feature_flags.id} = ${feature_flag_assignments.feature_flag_id} ;;
    relationship: one_to_many
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${feature_flag_assignments.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${feature_flag_assignments.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: releases {
    type:         left_outer
    sql_on:       ${feature_flags.id} = ${releases.feature_flag_id} ;;
    relationship: one_to_many
  }

  join: owner_user {
    from:         users
    type:         left_outer
    sql_on:       ${feature_flags.owner_user_id} = ${owner_user.id} ;;
    relationship: many_to_one
    view_label:   "Flag Owner"
    fields:       [owner_user.id, owner_user.email, owner_user.first_name, owner_user.last_name]
  }
}


# ----------------------------------------------------------------------------
# Feature Flag Assignments — exposure-level analysis
# ----------------------------------------------------------------------------
explore: feature_flag_assignments {
  label:        "Feature Flag Assignments"
  description:  "Per-(org, user) flag assignments with variant — used for A/B test exposure analysis."
  group_label:  "Feature Flags"
  persist_with: product_default

  join: feature_flags {
    type:         left_outer
    sql_on:       ${feature_flag_assignments.feature_flag_id} = ${feature_flags.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${feature_flag_assignments.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: users {
    type:         left_outer
    sql_on:       ${feature_flag_assignments.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


# ----------------------------------------------------------------------------
# Sessions — session-grain engagement
# ----------------------------------------------------------------------------
explore: sessions {
  label:        "Sessions"
  description:  "User sessions with device, geo, duration, event count, and engagement context."
  group_label:  "Engagement"
  persist_with: product_default

  join: users {
    type:         left_outer
    sql_on:       ${sessions.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type:         left_outer
    sql_on:       ${sessions.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: countries {
    type:         left_outer
    sql_on:       ${sessions.country_id} = ${countries.id} ;;
    relationship: many_to_one
  }

  # ui_events under sessions is fan-out heavy; fields list is restricted to
  # the most common slice-by columns. Symmetric aggregates handle the rest.
  join: ui_events {
    type:         left_outer
    sql_on:       ${sessions.id} = ${ui_events.session_id} ;;
    relationship: one_to_many
    fields:       [ui_events.event_name, ui_events.event_category, ui_events.page_path, ui_events.created_date, ui_events.created_time, ui_events.count]
  }

  join: page_views {
    type:         left_outer
    sql_on:       ${sessions.id} = ${page_views.session_id} ;;
    relationship: one_to_many
    fields:       [page_views.id, page_views.page_path, page_views.page_category, page_views.time_on_page_seconds, page_views.scroll_depth_pct, page_views.had_error, page_views.count]
  }
}
