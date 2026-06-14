# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_keystores_aliases_key_cert_file       │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_keystores_aliases_key_cert_file" "this" {

  alias       = ""     # string | required | Alias Name
  cert        = ""     # string | required | Cert content
  environment = ""     # string | required | Environment associated with the alias
  keystore    = ""     # string | required | Keystore Name
  org_id      = ""     # string | required | Organization ID associated with the alias
  id          = ""     # string | optional+computed
  key         = ""     # string | optional+sensitive | Private Key content, omit if uploading to truststore
  password    = ""     # string | optional+sensitive | Password for the Private Key if it's encrypted

  # type        = ""     # string | computed | Optional.Type of Alias

  certs_info { # list [0..1]

    cert_info { # list
      basic_constraints         = ""     # string | optional+computed | X.509 basic constraints extension.
      expiry_date               = ""     # string | optional+computed | X.509 notAfter validity period in milliseconds since epoch.
      is_valid                  = ""     # string | optional+computed | Flag that specifies whether the certificate is valid.  Flag …
      issuer                    = ""     # string | optional+computed | X.509 issuer.
      public_key                = ""     # string | optional+computed | Public key component of the X.509 subject public key info.
      serial_number             = ""     # string | optional+computed | X.509 serial number.
      sig_alg_name              = ""     # string | optional+computed | X.509 signatureAlgorithm.
      subject                   = ""     # string | optional+computed | X.509 subject.
      subject_alternative_names = []     # list(string) | optional+computed | X.509 subject alternative names (SANs) extension.
      valid_from                = ""     # string | optional+computed | X.509 notBefore validity period in milliseconds since epoch.
      version                   = 0      # number | optional+computed | X.509 version.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

