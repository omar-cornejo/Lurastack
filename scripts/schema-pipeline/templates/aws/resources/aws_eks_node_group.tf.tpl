# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_node_group                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_node_group" "this" {

  cluster_name           = ""     # string | required
  node_role_arn          = ""     # string | required
  subnet_ids             = []     # set(string) | required
  ami_type               = ""     # string | optional+computed
  capacity_type          = ""     # string | optional+computed
  disk_size              = 0      # number | optional+computed
  force_update_version   = false  # bool | optional
  id                     = ""     # string | optional+computed
  instance_types         = []     # list(string) | optional+computed
  labels                 = {}     # map(string) | optional
  node_group_name        = ""     # string | optional+computed
  node_group_name_prefix = ""     # string | optional+computed
  release_version        = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  version                = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # resources = [  # list(object)
  #   {
  #     autoscaling_groups = [  # list(object)
  #       {
  #         name = ""
  #       }
  #     ]
  #     remote_access_security_group_id = ""
  #   }
  # ]
  # status                 = ""     # string | computed

  launch_template { # list [0..1]
    version = ""     # string | required
    id      = ""     # string | optional+computed
    name    = ""     # string | optional+computed

  }

  node_repair_config { # list [0..1]
    enabled = false  # bool | optional

  }

  remote_access { # list [0..1]
    ec2_ssh_key               = ""     # string | optional
    source_security_group_ids = []     # set(string) | optional

  }

  scaling_config { # list [1..1]
    desired_size = 0      # number | required
    max_size     = 0      # number | required
    min_size     = 0      # number | required

  }

  taint { # set [0..50]
    effect = ""     # string | required
    key    = ""     # string | required
    value  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  update_config { # list [0..1]
    max_unavailable            = 0      # number | optional
    max_unavailable_percentage = 0      # number | optional

  }

}

