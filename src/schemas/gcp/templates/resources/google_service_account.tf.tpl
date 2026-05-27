# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_account                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_account" "this" {

  account_id                   = ""     # string | required | The account id that is used to generate the service account …
  create_ignore_already_exists = false  # bool | optional | If set to true, skip service account creation if a service a…
  description                  = ""     # string | optional | A text description of the service account. Must be less than…
  disabled                     = false  # bool | optional | Whether the service account is disabled. Defaults to false
  display_name                 = ""     # string | optional | The display name for the service account. Can be updated wit…
  id                           = ""     # string | optional+computed
  project                      = ""     # string | optional+computed | The ID of the project that the service account will be creat…

  # email                        = ""     # string | computed | The e-mail address of the service account. This value should…
  # member                       = ""     # string | computed | The Identity of the service account in the form 'serviceAcco…
  # name                         = ""     # string | computed | The fully-qualified name of the service account.
  # unique_id                    = ""     # string | computed | The unique id of the service account.

  timeouts { # single
    create = ""     # string | optional

  }

}

