# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_folder_iam_audit_config                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_folder_iam_audit_config" "this" {

  folder  = ""     # string | required
  service = ""     # string | required | Service which will be enabled for audit logging. The special…
  id      = ""     # string | optional+computed

  # etag    = ""     # string | computed | The etag of iam policy

  audit_log_config { # set [1..*]
    log_type         = ""     # string | required | Permission type for which logging is to be configured. Must …
    exempted_members = []     # set(string) | optional | Identities that do not cause logging for this type of permis…

  }

}

