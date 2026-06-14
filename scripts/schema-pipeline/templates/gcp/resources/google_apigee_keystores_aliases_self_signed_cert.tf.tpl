# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_keystores_aliases_self_signed_cert    │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_keystores_aliases_self_signed_cert" "this" {

  alias                 = ""     # string | required | Alias for the key/certificate pair. Values must match the re…
  environment           = ""     # string | required | The Apigee environment name
  keystore              = ""     # string | required | The Apigee keystore name associated in an Apigee environment
  org_id                = ""     # string | required | The Apigee Organization name associated with the Apigee envi…
  sig_alg               = ""     # string | required | Signature algorithm to generate private key. Valid values ar…
  cert_validity_in_days = 0      # number | optional | Validity duration of certificate, in days. Accepts positive …
  id                    = ""     # string | optional+computed
  key_size              = ""     # string | optional | Key size. Default and maximum value is 2048 bits.

  # certs_info = [  # list(object)
  #   {
  #     cert_info = [  # list(object)
  #       {
  #         basic_constraints = ""
  #         expiry_date = ""
  #         is_valid = ""
  #         issuer = ""
  #         public_key = ""
  #         serial_number = ""
  #         sig_alg_name = ""
  #         subject = ""
  #         subject_alternative_names = []  # list(string)
  #         valid_from = ""
  #         version = 0
  #       }
  #     ]
  #   }
  # ]
  # type                  = ""     # string | computed | Optional.Type of Alias

  subject { # list [1..1]
    common_name  = ""     # string | optional | Common name of the organization. Maximum length is 64 charac…
    country_code = ""     # string | optional | Two-letter country code. Example, IN for India, US for Unite…
    email        = ""     # string | optional | Email address. Max 255 characters.
    locality     = ""     # string | optional | City or town name. Maximum length is 128 characters.
    org          = ""     # string | optional | Organization name. Maximum length is 64 characters.
    org_unit     = ""     # string | optional | Organization team name. Maximum length is 64 characters.
    state        = ""     # string | optional | State or district name. Maximum length is 128 characters.

  }

  subject_alternative_dns_names { # list [0..1]
    subject_alternative_name = ""     # string | optional | Subject Alternative Name

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

