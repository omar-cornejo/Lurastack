# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_keystores_aliases_pkcs12              │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_keystores_aliases_pkcs12" "this" {

  alias       = ""     # string | required | Alias Name
  environment = ""     # string | required | Environment associated with the alias
  file        = ""     # string | required | Cert content
  filehash    = ""     # string | required | Hash of the pkcs file
  keystore    = ""     # string | required | Keystore Name
  org_id      = ""     # string | required | Organization ID associated with the alias
  id          = ""     # string | optional+computed
  password    = ""     # string | optional+computed | Password for the Private Key if it's encrypted

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
  # type        = ""     # string | computed | Optional.Type of Alias

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

