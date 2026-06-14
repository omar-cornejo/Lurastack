# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devopsguru_resource_collection                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devopsguru_resource_collection" "this" {

  type = ""     # string | required

  # id   = ""     # string | computed

  cloudformation { # list
    stack_names = []     # list(string) | required

  }

  tags { # list
    app_boundary_key = ""     # string | required
    tag_values       = []     # list(string) | required

  }

}

