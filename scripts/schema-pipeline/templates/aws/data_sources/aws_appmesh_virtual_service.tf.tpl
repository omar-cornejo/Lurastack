# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_virtual_service                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_virtual_service" "this" {

  mesh_name         = ""     # string | required
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
  #     provider = [  # list(object)
  #       {
  #         virtual_node = [  # list(object)
  #           {
  #             virtual_node_name = ""
  #           }
  #         ]
  #         virtual_router = [  # list(object)
  #           {
  #             virtual_router_name = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

