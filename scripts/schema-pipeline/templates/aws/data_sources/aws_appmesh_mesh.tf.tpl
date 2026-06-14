# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_mesh                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_mesh" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed
  mesh_owner        = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # resource_owner    = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     egress_filter = [  # list(object)
  #       {
  #         type = ""
  #       }
  #     ]
  #     service_discovery = [  # list(object)
  #       {
  #         ip_preference = ""
  #       }
  #     ]
  #   }
  # ]

}

