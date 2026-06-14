# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataproc_metastore_service_iam_policy            │
# └──────────────────────────────────────────────────────────────┘
data "google_dataproc_metastore_service_iam_policy" "this" {

  service_id  = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}

