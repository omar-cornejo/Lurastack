# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudsearch_domain                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudsearch_domain" "this" {

  name                      = ""     # string | required
  id                        = ""     # string | optional+computed
  multi_az                  = false  # bool | optional+computed

  # arn                       = ""     # string | computed
  # document_service_endpoint = ""     # string | computed
  # domain_id                 = ""     # string | computed
  # search_service_endpoint   = ""     # string | computed

  endpoint_options { # list [0..1]
    enforce_https       = false  # bool | optional+computed
    tls_security_policy = ""     # string | optional+computed

  }

  index_field { # set
    name            = ""     # string | required
    type            = ""     # string | required
    analysis_scheme = ""     # string | optional
    default_value   = ""     # string | optional
    facet           = false  # bool | optional
    highlight       = false  # bool | optional
    return          = false  # bool | optional
    search          = false  # bool | optional
    sort            = false  # bool | optional
    source_fields   = ""     # string | optional

  }

  scaling_parameters { # list [0..1]
    desired_instance_type     = ""     # string | optional+computed
    desired_partition_count   = 0      # number | optional+computed
    desired_replication_count = 0      # number | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

