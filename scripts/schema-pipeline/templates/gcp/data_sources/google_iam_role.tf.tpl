# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iam_role                                         │
# └──────────────────────────────────────────────────────────────┘
data "google_iam_role" "this" {

  name                 = ""     # string | required
  id                   = ""     # string | optional+computed

  # included_permissions = []     # list(string) | computed
  # stage                = ""     # string | computed
  # title                = ""     # string | computed

}

