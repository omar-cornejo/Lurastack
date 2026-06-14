# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_virtual_service                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_virtual_service" "this" {

  mesh_name         = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed
  mesh_owner        = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # resource_owner    = ""     # string | computed

  spec { # list [1..1]

    provider { # list [0..1]

      virtual_node { # list [0..1]
        virtual_node_name = ""     # string | required

      }

      virtual_router { # list [0..1]
        virtual_router_name = ""     # string | required

      }

    }

  }

}

