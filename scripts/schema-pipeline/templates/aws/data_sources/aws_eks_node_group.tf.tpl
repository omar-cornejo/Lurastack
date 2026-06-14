# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_node_group                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_node_group" "this" {

  cluster_name    = ""     # string | required
  node_group_name = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # ami_type        = ""     # string | computed
  # arn             = ""     # string | computed
  # capacity_type   = ""     # string | computed
  # disk_size       = 0      # number | computed
  # instance_types  = []     # list(string) | computed
  # labels          = {}     # map(string) | computed
  # launch_template = [  # list(object)
  #   {
  #     id = ""
  #     name = ""
  #     version = ""
  #   }
  # ]
  # node_role_arn   = ""     # string | computed
  # release_version = ""     # string | computed
  # remote_access = [  # list(object)
  #   {
  #     ec2_ssh_key = ""
  #     source_security_group_ids = []  # set(string)
  #   }
  # ]
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
  # scaling_config = [  # list(object)
  #   {
  #     desired_size = 0
  #     max_size = 0
  #     min_size = 0
  #   }
  # ]
  # status          = ""     # string | computed
  # subnet_ids      = []     # set(string) | computed
  # taints = [  # list(object)
  #   {
  #     effect = ""
  #     key = ""
  #     value = ""
  #   }
  # ]
  # version         = ""     # string | computed

}

