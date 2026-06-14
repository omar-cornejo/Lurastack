# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_topic_rule_destination                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_topic_rule_destination" "this" {

  enabled = false  # bool | optional
  id      = ""     # string | optional+computed

  # arn     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_configuration { # list [1..1]
    role_arn        = ""     # string | required
    subnet_ids      = []     # set(string) | required
    vpc_id          = ""     # string | required
    security_groups = []     # set(string) | optional

  }

}

