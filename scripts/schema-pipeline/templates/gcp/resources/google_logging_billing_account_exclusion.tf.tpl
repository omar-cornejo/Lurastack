# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_billing_account_exclusion            │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_billing_account_exclusion" "this" {

  billing_account = ""     # string | required
  filter          = ""     # string | required | The filter to apply when excluding logs. Only log entries th…
  name            = ""     # string | required | The name of the logging exclusion.
  description     = ""     # string | optional | A human-readable description.
  disabled        = false  # bool | optional | Whether this exclusion rule should be disabled or not. This …
  id              = ""     # string | optional+computed

}

