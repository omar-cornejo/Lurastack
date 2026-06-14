# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_replication_configuration                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_replication_configuration" "this" {

  id          = ""     # string | optional+computed

  # registry_id = ""     # string | computed

  replication_configuration { # list [0..1]

    rule { # list [1..10]

      destination { # list [1..25]
        region      = ""     # string | required
        registry_id = ""     # string | required

      }

      repository_filter { # list [0..100]
        filter      = ""     # string | required
        filter_type = ""     # string | required

      }

    }

  }

}

