# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_custom_key_store                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_custom_key_store" "this" {

  custom_key_store_name               = ""     # string | required
  cloud_hsm_cluster_id                = ""     # string | optional
  custom_key_store_type               = ""     # string | optional+computed
  id                                  = ""     # string | optional+computed
  key_store_password                  = ""     # string | optional
  trust_anchor_certificate            = ""     # string | optional
  xks_proxy_connectivity              = ""     # string | optional
  xks_proxy_uri_endpoint              = ""     # string | optional
  xks_proxy_uri_path                  = ""     # string | optional
  xks_proxy_vpc_endpoint_service_name = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  xks_proxy_authentication_credential { # list [0..1]
    access_key_id         = ""     # string | required
    raw_secret_access_key = ""     # string | required

  }

}

