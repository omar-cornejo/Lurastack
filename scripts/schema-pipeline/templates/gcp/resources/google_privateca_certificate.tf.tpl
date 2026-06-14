# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_certificate                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_certificate" "this" {

  location                     = ""     # string | required | Location of the Certificate. A full list of valid locations …
  name                         = ""     # string | required | The name for this Certificate.
  pool                         = ""     # string | required | The name of the CaPool this Certificate belongs to.
  certificate_authority        = ""     # string | optional | The Certificate Authority ID that should issue the certifica…
  certificate_template         = ""     # string | optional | The resource name for a CertificateTemplate used to issue th…
  id                           = ""     # string | optional+computed
  labels                       = {}     # map(string) | optional | Labels with user-defined metadata to apply to this resource.…
  lifetime                     = ""     # string | optional | The desired lifetime of the CA certificate. Used to create t…
  pem_csr                      = ""     # string | optional | Immutable. A pem-encoded X.509 certificate signing request (…
  project                      = ""     # string | optional+computed

  # certificate_description = [  # list(object)
  #   {
  #     aia_issuing_certificate_urls = []  # list(string)
  #     authority_key_id = [  # list(object)
  #       {
  #         key_id = ""
  #       }
  #     ]
  #     cert_fingerprint = [  # list(object)
  #       {
  #         sha256_hash = ""
  #       }
  #     ]
  #     crl_distribution_points = []  # list(string)
  #     public_key = [  # list(object)
  #       {
  #         format = ""
  #         key = ""
  #       }
  #     ]
  #     subject_description = [  # list(object)
  #       {
  #         hex_serial_number = ""
  #         lifetime = ""
  #         not_after_time = ""
  #         not_before_time = ""
  #         subject = [  # list(object)
  #           {
  #             common_name = ""
  #             country_code = ""
  #             locality = ""
  #             organization = ""
  #             organizational_unit = ""
  #             postal_code = ""
  #             province = ""
  #             street_address = ""
  #           }
  #         ]
  #         subject_alt_name = [  # list(object)
  #           {
  #             custom_sans = [  # list(object)
  #               {
  #                 critical = false
  #                 obect_id = [  # list(object)
  #                   {
  #                     object_id_path = []  # list(number)
  #                   }
  #                 ]
  #                 value = ""
  #               }
  #             ]
  #             dns_names = []  # list(string)
  #             email_addresses = []  # list(string)
  #             ip_addresses = []  # list(string)
  #             uris = []  # list(string)
  #           }
  #         ]
  #       }
  #     ]
  #     subject_key_id = [  # list(object)
  #       {
  #         key_id = ""
  #       }
  #     ]
  #     x509_description = [  # list(object)
  #       {
  #         additional_extensions = [  # list(object)
  #           {
  #             critical = false
  #             object_id = [  # list(object)
  #               {
  #                 object_id_path = []  # list(number)
  #               }
  #             ]
  #             value = ""
  #           }
  #         ]
  #         aia_ocsp_servers = []  # list(string)
  #         ca_options = [  # list(object)
  #           {
  #             is_ca = false
  #             max_issuer_path_length = 0
  #           }
  #         ]
  #         key_usage = [  # list(object)
  #           {
  #             base_key_usage = [  # list(object)
  #               {
  #                 cert_sign = false
  #                 content_commitment = false
  #                 crl_sign = false
  #                 data_encipherment = false
  #                 decipher_only = false
  #                 digital_signature = false
  #                 encipher_only = false
  #                 key_agreement = false
  #                 key_encipherment = false
  #               }
  #             ]
  #             extended_key_usage = [  # list(object)
  #               {
  #                 client_auth = false
  #                 code_signing = false
  #                 email_protection = false
  #                 ocsp_signing = false
  #                 server_auth = false
  #                 time_stamping = false
  #               }
  #             ]
  #             unknown_extended_key_usages = [  # list(object)
  #               {
  #                 object_id_path = []  # list(number)
  #               }
  #             ]
  #           }
  #         ]
  #         name_constraints = [  # list(object)
  #           {
  #             critical = false
  #             excluded_dns_names = []  # list(string)
  #             excluded_email_addresses = []  # list(string)
  #             excluded_ip_ranges = []  # list(string)
  #             excluded_uris = []  # list(string)
  #             permitted_dns_names = []  # list(string)
  #             permitted_email_addresses = []  # list(string)
  #             permitted_ip_ranges = []  # list(string)
  #             permitted_uris = []  # list(string)
  #           }
  #         ]
  #         policy_ids = [  # list(object)
  #           {
  #             object_id_path = []  # list(number)
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # create_time                  = ""     # string | computed | The time that this resource was created on the server. This …
  # effective_labels             = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # issuer_certificate_authority = ""     # string | computed | The resource name of the issuing CertificateAuthority in the…
  # pem_certificate              = ""     # string | computed | Output only. The pem-encoded, signed X.509 certificate.
  # pem_certificate_chain        = []     # list(string) | computed | The chain that may be used to verify the X.509 certificate. …
  # revocation_details = [  # list(object)
  #   {
  #     revocation_state = ""
  #     revocation_time = ""
  #   }
  # ]
  # terraform_labels             = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                  = ""     # string | computed | Output only. The time at which this CertificateAuthority was…

  config { # list [0..1]

    public_key { # list [1..1]
      format = ""     # string | required | The format of the public key. Currently, only PEM format is …
      key    = ""     # string | optional | Required. A public key. When this is specified in a request,…

    }

    subject_config { # list [1..1]

      subject { # list [1..1]
        common_name         = ""     # string | required | The common name of the distinguished name.
        organization        = ""     # string | required | The organization of the subject.
        country_code        = ""     # string | optional | The country code of the subject.
        locality            = ""     # string | optional | The locality or city of the subject.
        organizational_unit = ""     # string | optional | The organizational unit of the subject.
        postal_code         = ""     # string | optional | The postal code of the subject.
        province            = ""     # string | optional | The province, territory, or regional state of the subject.
        street_address      = ""     # string | optional | The street address of the subject.

      }

      subject_alt_name { # list [0..1]
        dns_names       = []     # list(string) | optional | Contains only valid, fully-qualified host names.
        email_addresses = []     # list(string) | optional | Contains only valid RFC 2822 E-mail addresses.
        ip_addresses    = []     # list(string) | optional | Contains only valid 32-bit IPv4 addresses or RFC 4291 IPv6 a…
        uris            = []     # list(string) | optional | Contains only valid RFC 3986 URIs.

      }

    }

    subject_key_id { # list [0..1]
      key_id = ""     # string | optional | The value of the KeyId in lowercase hexidecimal.

    }

    x509_config { # list [1..1]
      aia_ocsp_servers = []     # list(string) | optional | Describes Online Certificate Status Protocol (OCSP) endpoint…

      additional_extensions { # list
        critical = false  # bool | required | Indicates whether or not this extension is critical (i.e., i…
        value    = ""     # string | required | The value of this X.509 extension. A base64-encoded string.

        object_id { # list [1..1]
          object_id_path = []     # list(number) | required | An ObjectId specifies an object identifier (OID). These prov…

        }

      }

      ca_options { # list [0..1]
        is_ca                       = false  # bool | optional | When true, the "CA" in Basic Constraints extension will be s…
        max_issuer_path_length      = 0      # number | optional | Refers to the "path length constraint" in Basic Constraints …
        non_ca                      = false  # bool | optional | When true, the "CA" in Basic Constraints extension will be s…
        zero_max_issuer_path_length = false  # bool | optional | When true, the "path length constraint" in Basic Constraints…

      }

      key_usage { # list [1..1]

        base_key_usage { # list [1..1]
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

        extended_key_usage { # list [1..1]
          client_auth      = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.2. Officially described a…
          code_signing     = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.3. Officially described a…
          email_protection = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.4. Officially described a…
          ocsp_signing     = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described a…
          server_auth      = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.1. Officially described a…
          time_stamping    = false  # bool | optional | Corresponds to OID 1.3.6.1.5.5.7.3.8. Officially described a…

        }

        unknown_extended_key_usages { # list
          object_id_path = []     # list(number) | required | An ObjectId specifies an object identifier (OID). These prov…

        }

      }

      name_constraints { # list [0..1]
        critical                  = false  # bool | required | Indicates whether or not the name constraints are marked cri…
        excluded_dns_names        = []     # list(string) | optional | Contains excluded DNS names. Any DNS name that can be constr…
        excluded_email_addresses  = []     # list(string) | optional | Contains the excluded email addresses. The value can be a pa…
        excluded_ip_ranges        = []     # list(string) | optional | Contains the excluded IP ranges. For IPv4 addresses, the ran…
        excluded_uris             = []     # list(string) | optional | Contains the excluded URIs that apply to the host part of th…
        permitted_dns_names       = []     # list(string) | optional | Contains permitted DNS names. Any DNS name that can be const…
        permitted_email_addresses = []     # list(string) | optional | Contains the permitted email addresses. The value can be a p…
        permitted_ip_ranges       = []     # list(string) | optional | Contains the permitted IP ranges. For IPv4 addresses, the ra…
        permitted_uris            = []     # list(string) | optional | Contains the permitted URIs that apply to the host part of t…

      }

      policy_ids { # list
        object_id_path = []     # list(number) | required | An ObjectId specifies an object identifier (OID). These prov…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

