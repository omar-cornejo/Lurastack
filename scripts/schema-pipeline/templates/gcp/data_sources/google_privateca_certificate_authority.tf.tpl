# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_privateca_certificate_authority                  │
# └──────────────────────────────────────────────────────────────┘
data "google_privateca_certificate_authority" "this" {

  certificate_authority_id               = ""     # string | optional | The user provided Resource ID for this Certificate Authority…
  id                                     = ""     # string | optional+computed
  location                               = ""     # string | optional | Location of the CertificateAuthority. A full list of valid l…
  pool                                   = ""     # string | optional | The name of the CaPool this Certificate Authority belongs to…
  project                                = ""     # string | optional

  # access_urls = [  # list(object)
  #   {
  #     ca_certificate_access_url = ""
  #     crl_access_urls = []  # list(string)
  #   }
  # ]
  # config = [  # list(object)
  #   {
  #     subject_config = [  # list(object)
  #       {
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
  #     x509_config = [  # list(object)
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
  #             non_ca = false
  #             zero_max_issuer_path_length = false
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
  # create_time                            = ""     # string | computed | The time at which this CertificateAuthority was created.  A …
  # deletion_protection                    = false  # bool | computed | Whether Terraform will be prevented from destroying the Cert…
  # desired_state                          = ""     # string | computed | Desired state of the CertificateAuthority. Set this field to…
  # effective_labels                       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # gcs_bucket                             = ""     # string | computed | The name of a Cloud Storage bucket where this CertificateAut…
  # ignore_active_certificates_on_deletion = false  # bool | computed | This field allows the CA to be deleted even if the CA has ac…
  # key_spec = [  # list(object)
  #   {
  #     algorithm = ""
  #     cloud_kms_key_version = ""
  #   }
  # ]
  # labels                                 = {}     # map(string) | computed | Labels with user-defined metadata.  An object containing a l…
  # lifetime                               = ""     # string | computed | The desired lifetime of the CA certificate. Used to create t…
  # name                                   = ""     # string | computed | The resource name for this CertificateAuthority in the forma…
  # pem_ca_certificate                     = ""     # string | computed | The signed CA certificate issued from the subordinated CA's …
  # pem_ca_certificates                    = []     # list(string) | computed | This CertificateAuthority's certificate chain, including the…
  # pem_csr                                = ""     # string | computed
  # skip_grace_period                      = false  # bool | computed | If this flag is set, the Certificate Authority will be delet…
  # state                                  = ""     # string | computed | The State for this CertificateAuthority.
  # subordinate_config = [  # list(object)
  #   {
  #     certificate_authority = ""
  #     pem_issuer_chain = [  # list(object)
  #       {
  #         pem_certificates = []  # list(string)
  #       }
  #     ]
  #   }
  # ]
  # terraform_labels                       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type                                   = ""     # string | computed | The Type of this CertificateAuthority.  ~> **Note:** For 'SU…
  # update_time                            = ""     # string | computed | The time at which this CertificateAuthority was updated.  A …

}

