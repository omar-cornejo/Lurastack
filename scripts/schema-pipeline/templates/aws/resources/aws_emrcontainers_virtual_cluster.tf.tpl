# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emrcontainers_virtual_cluster                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emrcontainers_virtual_cluster" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  container_provider { # list [1..1]
    id   = ""     # string | required
    type = ""     # string | required

    info { # list [1..1]

      eks_info { # list [1..1]
        namespace = ""     # string | optional

      }

    }

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

