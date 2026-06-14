# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_certificate_manager_certificate              │
# └──────────────────────────────────────────────────────────────┘
resource "google_certificate_manager_certificate" "this" {

  name             = ""     # string | required | A user-defined name of the certificate. Certificate names mu…
  description      = ""     # string | optional | A human-readable description of the resource.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Set of label tags associated with the Certificate resource. …
  location         = ""     # string | optional | The Certificate Manager location. If not specified, "global"…
  project          = ""     # string | optional+computed
  scope            = ""     # string | optional | The scope of the certificate.  DEFAULT: Certificates with de…

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  managed { # list [0..1]
    dns_authorizations         = []     # list(string) | optional | Authorizations that will be used for performing domain autho…
    domains                    = []     # list(string) | optional | The domains for which a managed SSL certificate will be gene…
    issuance_config            = ""     # string | optional | The resource name for a CertificateIssuanceConfig used to co…

    # authorization_attempt_info = [  # list(object)
    #   {
    #     details = ""
    #     domain = ""
    #     failure_reason = ""
    #     state = ""
    #   }
    # ]
    # provisioning_issue = [  # list(object)
    #   {
    #     details = ""
    #     reason = ""
    #   }
    # ]
    # state                      = ""     # string | computed | A state of this Managed Certificate.

  }

  self_managed { # list [0..1]
    certificate_pem = ""     # string | optional+sensitive+DEPRECATED | The certificate chain in PEM-encoded form.  Leaf certificate…
    pem_certificate = ""     # string | optional | The certificate chain in PEM-encoded form.  Leaf certificate…
    pem_private_key = ""     # string | optional+sensitive | The private key of the leaf certificate in PEM-encoded form.
    private_key_pem = ""     # string | optional+sensitive+DEPRECATED | The private key of the leaf certificate in PEM-encoded form.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

