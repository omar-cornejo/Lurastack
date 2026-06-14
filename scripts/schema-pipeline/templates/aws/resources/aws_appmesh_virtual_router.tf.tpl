# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_virtual_router                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_virtual_router" "this" {

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

    listener { # list

      port_mapping { # list [1..1]
        port     = 0      # number | required
        protocol = ""     # string | required

      }

    }

  }

}

