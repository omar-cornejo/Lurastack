# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appmesh_mesh                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appmesh_mesh" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # mesh_owner        = ""     # string | computed
  # resource_owner    = ""     # string | computed

  spec { # list [0..1]

    egress_filter { # list [0..1]
      type = ""     # string | optional

    }

    service_discovery { # list [0..1]
      ip_preference = ""     # string | optional

    }

  }

}

