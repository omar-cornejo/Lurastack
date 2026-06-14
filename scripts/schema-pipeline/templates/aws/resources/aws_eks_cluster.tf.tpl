# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_cluster" "this" {

  name                          = ""     # string | required
  role_arn                      = ""     # string | required
  bootstrap_self_managed_addons = false  # bool | optional
  enabled_cluster_log_types     = []     # set(string) | optional
  force_update_version          = false  # bool | optional
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  version                       = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # certificate_authority = [  # list(object)
  #   {
  #     data = ""
  #   }
  # ]
  # cluster_id                    = ""     # string | computed
  # created_at                    = ""     # string | computed
  # endpoint                      = ""     # string | computed
  # identity = [  # list(object)
  #   {
  #     oidc = [  # list(object)
  #       {
  #         issuer = ""
  #       }
  #     ]
  #   }
  # ]
  # platform_version              = ""     # string | computed
  # status                        = ""     # string | computed

  access_config { # list [0..1]
    authentication_mode                         = ""     # string | optional+computed
    bootstrap_cluster_creator_admin_permissions = false  # bool | optional

  }

  compute_config { # list [0..1]
    enabled       = false  # bool | optional
    node_pools    = []     # set(string) | optional
    node_role_arn = ""     # string | optional

  }

  encryption_config { # list [0..1]
    resources = []     # set(string) | required

    provider { # list [1..1]
      key_arn = ""     # string | required

    }

  }

  kubernetes_network_config { # list [0..1]
    ip_family         = ""     # string | optional+computed
    service_ipv4_cidr = ""     # string | optional+computed

    # service_ipv6_cidr = ""     # string | computed

    elastic_load_balancing { # list [0..1]
      enabled = false  # bool | optional

    }

  }

  outpost_config { # list [0..1]
    control_plane_instance_type = ""     # string | required
    outpost_arns                = []     # set(string) | required

    control_plane_placement { # list [0..1]
      group_name = ""     # string | required

    }

  }

  remote_network_config { # list [0..1]

    remote_node_networks { # list [1..1]
      cidrs = []     # set(string) | optional

    }

    remote_pod_networks { # list [0..1]
      cidrs = []     # set(string) | optional

    }

  }

  storage_config { # list [0..1]

    block_storage { # list [0..1]
      enabled = false  # bool | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  upgrade_policy { # list [0..1]
    support_type = ""     # string | optional+computed

  }

  vpc_config { # list [1..1]
    subnet_ids                = []     # set(string) | required
    endpoint_private_access   = false  # bool | optional
    endpoint_public_access    = false  # bool | optional
    public_access_cidrs       = []     # set(string) | optional+computed
    security_group_ids        = []     # set(string) | optional

    # cluster_security_group_id = ""     # string | computed
    # vpc_id                    = ""     # string | computed

  }

  zonal_shift_config { # list [0..1]
    enabled = false  # bool | optional

  }

}

