# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_certificate_manager_dns_authorization        │
# └──────────────────────────────────────────────────────────────┘
resource "google_certificate_manager_dns_authorization" "this" {

  domain              = ""     # string | required | A domain which is being authorized. A DnsAuthorization resou…
  name                = ""     # string | required | Name of the resource; provided by the client when the resour…
  description         = ""     # string | optional | A human-readable description of the resource.
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | Set of label tags associated with the DNS Authorization reso…
  location            = ""     # string | optional | The Certificate Manager location. If not specified, "global"…
  project             = ""     # string | optional+computed
  type                = ""     # string | optional+computed | type of DNS authorization. If unset during the resource crea…

  # dns_resource_record = [  # list(object)
  #   {
  #     data = ""
  #     name = ""
  #     type = ""
  #   }
  # ]
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

