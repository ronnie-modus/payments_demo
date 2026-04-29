# AUTO-GENERATED — payments_demo LookML project
view: ocr_extractions {
  sql_table_name: `modus-playground.payments_demo.ocr_extractions` ;;
  label: "Ocr Extractions"
  view_label: "Ocr Extractions"
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
    hidden: yes
    value_format_name: id
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to organizations.id"
  }

  dimension: bill_id {
    type: number
    sql: ${TABLE}.bill_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to bills.id"
  }

  dimension: upload_filename {
    type: string
    sql: ${TABLE}.upload_filename ;;
  }

  dimension: upload_size_bytes {
    type: number
    sql: ${TABLE}.upload_size_bytes ;;
  }

  dimension: mime_type {
    type: string
    sql: ${TABLE}.mime_type ;;
  }

  dimension: pages_count {
    type: number
    sql: ${TABLE}.pages_count ;;
    group_label: "Metrics"
  }

  dimension: template_detected {
    type: string
    sql: ${TABLE}.template_detected ;;
  }

  dimension: ocr_engine_version {
    type: string
    sql: ${TABLE}.ocr_engine_version ;;
  }

  dimension: ocr_duration_ms {
    type: number
    sql: ${TABLE}.ocr_duration_ms ;;
    value_format_name: decimal_0
  }

  dimension: extracted_vendor_name {
    type: string
    sql: ${TABLE}.extracted_vendor_name ;;
  }

  dimension: extracted_vendor_name_confidence {
    type: number
    sql: ${TABLE}.extracted_vendor_name_confidence ;;
    value_format_name: percent_2
  }

  dimension: extracted_total_amount {
    type: number
    sql: ${TABLE}.extracted_total_amount ;;
    value_format_name: decimal_2
  }

  dimension: extracted_total_amount_confidence {
    type: number
    sql: ${TABLE}.extracted_total_amount_confidence ;;
    value_format_name: percent_2
  }

  dimension: extracted_due_date_confidence {
    type: number
    sql: ${TABLE}.extracted_due_date_confidence ;;
    value_format_name: percent_2
  }

  dimension: extracted_invoice_number {
    type: string
    sql: ${TABLE}.extracted_invoice_number ;;
  }

  dimension: extracted_line_count {
    type: number
    sql: ${TABLE}.extracted_line_count ;;
    group_label: "Metrics"
  }

  dimension: overall_confidence {
    type: number
    sql: ${TABLE}.overall_confidence ;;
    value_format_name: percent_2
  }

  dimension: had_extraction_error {
    type: yesno
    sql: ${TABLE}.had_extraction_error = TRUE ;;
  }

  dimension: was_corrected_by_user {
    type: yesno
    sql: ${TABLE}.was_corrected_by_user = TRUE ;;
  }

  dimension: corrected_by_user_id {
    type: number
    sql: ${TABLE}.corrected_by_user_id ;;
    hidden: yes
    value_format_name: id
    description: "Foreign key to users.id"
  }

  dimension: corrected_fields_json {
    type: string
    sql: ${TABLE}.corrected_fields_json ;;
    hidden: yes
    description: "JSON payload — hidden by default"
  }

  dimension: time_to_correction_seconds {
    type: number
    sql: ${TABLE}.time_to_correction_seconds ;;
    value_format_name: decimal_0
  }

  dimension_group: ocr_started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ocr_started_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: ocr_completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ocr_completed_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: extracted_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.extracted_due_date ;;
    datatype: date
    convert_tz: no
    group_label: "Dates"
  }

  dimension_group: corrected {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.corrected_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
    group_label: "Timestamps"
  }


  # ---------- Measures ----------


  measure: count {
    type: count
    drill_fields: [id, created_date]
  }



  measure: sum_pages_count {
    type: sum
    sql: ${TABLE}.pages_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }
  measure: sum_extracted_line_count {
    type: sum
    sql: ${TABLE}.extracted_line_count ;;
    value_format_name: decimal_0
    group_label: "Counts"
  }

  measure: avg_time_to_correction_seconds {
    type: average
    sql: ${TABLE}.time_to_correction_seconds ;;
    value_format_name: decimal_1
    group_label: "Durations"
  }

  measure: count_distinct_organizations {
    type: count_distinct
    sql: ${TABLE}.organization_id ;;
    label: "Unique Organizations"
    group_label: "Counts"
  }

}
