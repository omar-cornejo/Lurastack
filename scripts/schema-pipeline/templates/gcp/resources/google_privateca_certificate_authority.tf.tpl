# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privateca_certificate_authority              │
# └──────────────────────────────────────────────────────────────┘
resource "google_privateca_certificate_authority" "this" {

  certificate_authority_id               = ""     # string | required | The user provided Resource ID for this Certificate Authority…
  location                               = ""     # string | required | Location of the CertificateAuthority. A full list of valid l…
  pool                                   = ""     # string | required | The name of the CaPool this Certificate Authority belongs to…
  deletion_protection                    = false  # bool | optional | Whether Terraform will be prevented from destroying the Cert…
  desired_state                          = ""     # string | optional | Desired state of the CertificateAuthority. Set this field to…
  gcs_bucket                             = ""     # string | optional | The name of a Cloud Storage bucket where this CertificateAut…
  id                                     = ""     # string | optional+computed
  ignore_active_certificates_on_deletion = false  # bool | optional | This field allows the CA to be deleted even if the CA has ac…
  labels                                 = {}     # map(string) | optional | Labels with user-defined metadata.  An object containing a l…
  lifetime                               = ""     # string | optional | The desired lifetime of the CA certificate. Used to create t…
  pem_ca_certificate                     = ""     # string | optional | The signed CA certificate issued from the subordinated CA's …
  project                                = ""     # string | optional+computed
  skip_grace_period                      = false  # bool | optional | If this flag is set, the Certificate Authority will be delet…
  type                                   = ""     # string | optional | The Type of this CertificateAuthority.  ~> **Note:** For 'SU…

  # access_urls = [  # list(object)
  #   {
  #     ca_certificate_access_url = ""
  #     crl_access_urls = []  # list(string)
  #   }
  # ]
  # create_time                            = ""     # string | computed | The time at which this CertificateAuthority was created.  A …
  # effective_labels                       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                                   = ""     # string | computed | The resource name for this CertificateAuthority in the forma…
  # pem_ca_certificates                    = []     # list(string) | computed | This CertificateAuthority's certificate chain, including the…
  # state                                  = ""     # string | computed | The State for this CertificateAuthority.
  # terraform_labels                       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                            = ""     # string | computed | The time at which this CertificateAuthority was updated.  A …

  config { # list [1..1]

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

      ca_options { # list [1..1]
        is_ca                       = false  # bool | required | When true, the "CA" in Basic Constraints extension will be s…
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

  key_spec { # list [1..1]
    algorithm             = ""     # string | optional | The algorithm to use for creating a managed Cloud KMS key fo…
    cloud_kms_key_version = ""     # string | optional | The resource name for an existing Cloud KMS CryptoKeyVersion…

  }

  subordinate_config { # list [0..1]
    certificate_authority = ""     # string | optional | This can refer to a CertificateAuthority that was used to cr…

    pem_issuer_chain { # list [0..1]
      pem_certificates = []     # list(string) | optional | Expected to be in leaf-to-root order according to RFC 5246.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

