# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_cluster                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_cluster" "this" {

  name                      = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # access_config = [  # list(object)
  #   {
  #     authentication_mode = ""
  #     bootstrap_cluster_creator_admin_permissions = false
  #   }
  # ]
  # arn                       = ""     # string | computed
  # certificate_authority = [  # list(object)
  #   {
  #     data = ""
  #   }
  # ]
  # cluster_id                = ""     # string | computed
  # compute_config = [  # list(object)
  #   {
  #     enabled = false
  #     node_pools = []  # set(string)
  #     node_role_arn = ""
  #   }
  # ]
  # created_at                = ""     # string | computed
  # enabled_cluster_log_types = []     # set(string) | computed
  # endpoint                  = ""     # string | computed
  # identity = [  # list(object)
  #   {
  #     oidc = [  # list(object)
  #       {
  #         issuer = ""
  #       }
  #     ]
  #   }
  # ]
  # kubernetes_network_config = [  # list(object)
  #   {
  #     elastic_load_balancing = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     ip_family = ""
  #     service_ipv4_cidr = ""
  #     service_ipv6_cidr = ""
  #   }
  # ]
  # outpost_config = [  # list(object)
  #   {
  #     control_plane_instance_type = ""
  #     control_plane_placement = [  # list(object)
  #       {
  #         group_name = ""
  #       }
  #     ]
  #     outpost_arns = []  # set(string)
  #   }
  # ]
  # platform_version          = ""     # string | computed
  # remote_network_config = [  # list(object)
  #   {
  #     remote_node_networks = [  # list(object)
  #       {
  #         cidrs = []  # set(string)
  #       }
  #     ]
  #     remote_pod_networks = [  # list(object)
  #       {
  #         cidrs = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # role_arn                  = ""     # string | computed
  # status                    = ""     # string | computed
  # storage_config = [  # list(object)
  #   {
  #     block_storage = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #   }
  # ]
  # upgrade_policy = [  # list(object)
  #   {
  #     support_type = ""
  #   }
  # ]
  # version                   = ""     # string | computed
  # vpc_config = [  # list(object)
  #   {
  #     cluster_security_group_id = ""
  #     endpoint_private_access = false
  #     endpoint_public_access = false
  #     public_access_cidrs = []  # set(string)
  #     security_group_ids = []  # set(string)
  #     subnet_ids = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]
  # zonal_shift_config = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]

}

