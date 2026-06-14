# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_endpoint                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_endpoint" "this" {

  attachment_type             = ""     # string | required
  endpoint_type               = ""     # string | required
  verified_access_group_id    = ""     # string | required
  application_domain          = ""     # string | optional
  description                 = ""     # string | optional
  domain_certificate_arn      = ""     # string | optional
  endpoint_domain_prefix      = ""     # string | optional
  id                          = ""     # string | optional+computed
  policy_document             = ""     # string | optional
  security_group_ids          = []     # set(string) | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # device_validation_domain    = ""     # string | computed
  # endpoint_domain             = ""     # string | computed
  # verified_access_instance_id = ""     # string | computed

  cidr_options { # list [0..1]
    cidr       = ""     # string | required
    protocol   = ""     # string | optional
    subnet_ids = []     # set(string) | optional

    port_range { # set [1..*]
      from_port = 0      # number | required
      to_port   = 0      # number | required

    }

  }

  load_balancer_options { # list [0..1]
    load_balancer_arn = ""     # string | optional
    port              = 0      # number | optional
    protocol          = ""     # string | optional
    subnet_ids        = []     # set(string) | optional

    port_range { # set
      from_port = 0      # number | required
      to_port   = 0      # number | required

    }

  }

  network_interface_options { # list [0..1]
    network_interface_id = ""     # string | optional
    port                 = 0      # number | optional
    protocol             = ""     # string | optional

    port_range { # set
      from_port = 0      # number | required
      to_port   = 0      # number | required

    }

  }

  rds_options { # list [0..1]
    port                = 0      # number | optional
    protocol            = ""     # string | optional
    rds_db_cluster_arn  = ""     # string | optional
    rds_db_instance_arn = ""     # string | optional
    rds_db_proxy_arn    = ""     # string | optional
    rds_endpoint        = ""     # string | optional
    subnet_ids          = []     # set(string) | optional

  }

  sse_specification { # list [0..1]
    customer_managed_key_enabled = false  # bool | optional
    kms_key_arn                  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

