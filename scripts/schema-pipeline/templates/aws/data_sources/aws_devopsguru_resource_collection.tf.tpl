# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_devopsguru_resource_collection                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_devopsguru_resource_collection" "this" {

  type = ""     # string | required

  # id   = ""     # string | computed

  cloudformation { # list

    # stack_names = []     # list(string) | computed

  }

  tags { # list

    # app_boundary_key = ""     # string | computed
    # tag_values       = []     # list(string) | computed

  }

}

