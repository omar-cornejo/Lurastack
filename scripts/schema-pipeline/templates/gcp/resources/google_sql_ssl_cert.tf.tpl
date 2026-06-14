# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sql_ssl_cert                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_sql_ssl_cert" "this" {

  common_name        = ""     # string | required | The common name to be used in the certificate to identify th…
  instance           = ""     # string | required | The name of the Cloud SQL instance. Changing this forces a n…
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  # cert               = ""     # string | computed+sensitive | The actual certificate data for this client certificate.
  # cert_serial_number = ""     # string | computed | The serial number extracted from the certificate data.
  # create_time        = ""     # string | computed | The time when the certificate was created in RFC 3339 format…
  # expiration_time    = ""     # string | computed | The time when the certificate expires in RFC 3339 format, fo…
  # private_key        = ""     # string | computed+sensitive | The private key associated with the client certificate.
  # server_ca_cert     = ""     # string | computed+sensitive | The CA cert of the server this client cert was generated fro…
  # sha1_fingerprint   = ""     # string | computed | The SHA1 Fingerprint of the certificate.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

