# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_glue_script                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_glue_script" "this" {

  id            = ""     # string | optional+computed
  language      = ""     # string | optional

  # python_script = ""     # string | computed
  # scala_code    = ""     # string | computed

  dag_edge { # list [1..*]
    source           = ""     # string | required
    target           = ""     # string | required
    target_parameter = ""     # string | optional

  }

  dag_node { # list [1..*]
    id          = ""     # string | required
    node_type   = ""     # string | required
    line_number = 0      # number | optional

    args { # list [1..*]
      name  = ""     # string | required
      value = ""     # string | required
      param = false  # bool | optional

    }

  }

}

