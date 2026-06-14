# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_sql_ca_certs                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_sql_ca_certs" "this" {

  instance       = ""     # string | required
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  # active_version = ""     # string | computed
  # certs = [  # list(object)
  #   {
  #     cert = ""
  #     common_name = ""
  #     create_time = ""
  #     expiration_time = ""
  #     sha1_fingerprint = ""
  #   }
  # ]

}

