# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dax_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dax_cluster" "this" {

  cluster_name                     = ""     # string | required
  iam_role_arn                     = ""     # string | required
  node_type                        = ""     # string | required
  replication_factor               = 0      # number | required
  availability_zones               = []     # set(string) | optional
  cluster_endpoint_encryption_type = ""     # string | optional
  description                      = ""     # string | optional
  id                               = ""     # string | optional+computed
  maintenance_window               = ""     # string | optional+computed
  notification_topic_arn           = ""     # string | optional
  parameter_group_name             = ""     # string | optional+computed
  security_group_ids               = []     # set(string) | optional+computed
  subnet_group_name                = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # cluster_address                  = ""     # string | computed
  # configuration_endpoint           = ""     # string | computed
  # nodes = [  # list(object)
  #   {
  #     address = ""
  #     availability_zone = ""
  #     id = ""
  #     port = 0
  #   }
  # ]
  # port                             = 0      # number | computed

  server_side_encryption { # list [0..1]
    enabled = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

