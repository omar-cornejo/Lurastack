# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_emrcontainers_virtual_cluster                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_emrcontainers_virtual_cluster" "this" {

  virtual_cluster_id = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # container_provider = [  # list(object)
  #   {
  #     id = ""
  #     info = [  # list(object)
  #       {
  #         eks_info = [  # list(object)
  #           {
  #             namespace = ""
  #           }
  #         ]
  #       }
  #     ]
  #     type = ""
  #   }
  # ]
  # created_at         = ""     # string | computed
  # name               = ""     # string | computed
  # state              = ""     # string | computed

}

