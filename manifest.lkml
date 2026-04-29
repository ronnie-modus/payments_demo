project_name: "payments_demo"
label:        "Payments Demo"

# ----------------------------------------------------------------------------
# Project-wide constants — referenced anywhere in LookML as @{constant_name}
# Centralizing the dataset path means a future migration only edits this file.
# ----------------------------------------------------------------------------

constant: bq_project {
  value: "modus-playground"
  export: override_required
}

constant: bq_dataset {
  value: "payments_demo"
  export: override_required
}

constant: dataset_path {
  value: "modus-playground.payments_demo"
}
