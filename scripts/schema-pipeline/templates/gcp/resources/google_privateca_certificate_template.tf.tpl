# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_certificate_template               │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_certificate_template" "this" {

  location         = ""     # string | required | The location for the resource
  name             = ""     # string | required | The resource name for this CertificateTemplate in the format…
  description      = ""     # string | optional | Optional. A human-readable description of scenarios this tem…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Optional. Labels with user-defined metadata.  **Note**: This…
  maximum_lifetime = ""     # string | optional | Optional. The maximum lifetime allowed for all issued certif…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Output only. The time at which this CertificateTemplate was …
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Output only. The time at which this CertificateTemplate was …

  identity_constraints { # list [0..1]
    allow_subject_alt_names_passthrough = false  # bool | required | Required. If this is true, the SubjectAltNames extension may…
    allow_subject_passthrough           = false  # bool | required | Required. If this is true, the Subject field may be copied f…

    cel_expression { # list [0..1]
      description = ""     # string | optional | Optional. Description of the expression. This is a longer te…
      expression  = ""     # string | optional | Textual representation of an expression in Common Expression…
      location    = ""     # string | optional | Optional. String indicating the location of the expression f…
      title       = ""     # string | optional | Optional. Title for the expression, i.e. a short string desc…

    }

  }

  passthrough_extensions { # list [0..1]
    known_extensions = []     # list(string) | optional | Optional. A set of named X.509 extensions. Will be combined …

    additional_extensions { # list
      object_id_path = []     # list(number) | required | Required. The parts of an OID path. The most significant par…

    }

  }

  predefined_values { # list [0..1]
    aia_ocsp_servers = []     # list(string) | optional | Optional. Describes Online Certificate Status Protocol (OCSP…

    additional_extensions { # list
      value    = ""     # string | required | Required. The value of this X.509 extension.
      critical = false  # bool | optional | Optional. Indicates whether or not this extension is critica…

      object_id { # list [1..1]
        object_id_path = []     # list(number) | required | Required. The parts of an OID path. The most significant par…

      }

    }

    ca_options { # list [0..1]
      is_ca                  = false  # bool | optional | Optional. Refers to the "CA" X.509 extension, which is a boo…
      max_issuer_path_length = 0      # number | optional | Optional. Refers to the path length restriction X.509 extens…

    }

    key_usage { # list [0..1]

      base_key_usage { # list [0..1]
        cert_sign          = false  # bool | optional | The key may be used to sign certificates.
        content_commitment = false  # bool | optional | The key may be used for cryptographic commitments. Note that…
        crl_sign           = false  # bool | optional | The key may be used sign certificate revocation lists.
        data_encipherment  = false  # bool | optional | The key may be used to encipher data.
        decipher_only      = false  # bool | optional | The key may be used to decipher only.
        digital_signature  = false  # bool | optional | The key may be used for digital signatures.
        encipher_only      = false  # bool | optional | The key may be used to encipher only.
        key_agreement      = false  # bool | optional | The key may be used in a key agreement protocol.
        key_encipherment   = false  # bool | optional | The key may be used to encipher other keys.

      }

      extended_key_usage { # list [0..1]
        client_auth      = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.2. Officially described a…
        code_signing     = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.3. Officially described a…
        email_protection = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.4. Officially described a…
        ocsp_signing     = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described a…
        server_auth      = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.1. Officially described a…
        time_stamping    = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.8. Officially described a…

      }

      unknown_extended_key_usages { # list
        object_id_path = []     # list(number) | required | Required. The parts of an OID path. The most significant par…

      }

    }

    policy_ids { # list
      object_id_path = []     # list(number) | required | Required. The parts of an OID path. The most significant par…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

