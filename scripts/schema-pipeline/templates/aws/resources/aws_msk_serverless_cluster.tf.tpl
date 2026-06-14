# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_serverless_cluster                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_serverless_cluster" "this" {

  cluster_name               = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # bootstrap_brokers_sasl_iam = ""     # string | computed
  # cluster_uuid               = ""     # string | computed

  client_authentication { # list [1..1]

    sasl { # list [1..1]

      iam { # list [1..1]
        enabled = false  # bool | required

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

  vpc_config { # list [1..*]
    subnet_ids         = []     # set(string) | required
    security_group_ids = []     # set(string) | optional+computed

  }

}

