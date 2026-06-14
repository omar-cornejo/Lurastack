# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticsearch_domain_saml_options               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticsearch_domain_saml_options" "this" {

  domain_name = ""     # string | required
  id          = ""     # string | optional+computed

  saml_options { # list [0..1]
    enabled                 = false  # bool | optional
    master_backend_role     = ""     # string | optional
    master_user_name        = ""     # string | optional+sensitive
    roles_key               = ""     # string | optional
    session_timeout_minutes = 0      # number | optional
    subject_key             = ""     # string | optional

    idp { # list [0..1]
      entity_id        = ""     # string | required
      metadata_content = ""     # string | required

    }

  }

  timeouts { # single
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

