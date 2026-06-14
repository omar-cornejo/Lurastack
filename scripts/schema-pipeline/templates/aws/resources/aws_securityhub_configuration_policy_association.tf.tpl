# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_configuration_policy_association    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_configuration_policy_association" "this" {

  policy_id = ""     # string | required | The universally unique identifier (UUID) of the configuratio…
  target_id = ""     # string | required | The identifier of the target account, organizational unit, o…
  id        = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

