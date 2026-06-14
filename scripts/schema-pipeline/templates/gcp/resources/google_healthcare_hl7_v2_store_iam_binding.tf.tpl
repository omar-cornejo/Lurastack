# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_hl7_v2_store_iam_binding          │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_hl7_v2_store_iam_binding" "this" {

  hl7_v2_store_id = ""     # string | required
  members         = []     # set(string) | required
  role            = ""     # string | required
  id              = ""     # string | optional+computed

  # etag            = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}

