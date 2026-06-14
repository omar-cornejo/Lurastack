# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_iam_member_remove                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_iam_member_remove" "this" {

  member  = ""     # string | required | The IAM principal that should not have the target role.
  project = ""     # string | required | The project id of the target project.
  role    = ""     # string | required | The target role that should be removed.
  id      = ""     # string | optional+computed

}

