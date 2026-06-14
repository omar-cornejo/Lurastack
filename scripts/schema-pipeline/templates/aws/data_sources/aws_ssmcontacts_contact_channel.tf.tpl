# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmcontacts_contact_channel                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmcontacts_contact_channel" "this" {

  arn               = ""     # string | required
  id                = ""     # string | optional+computed

  # activation_status = ""     # string | computed
  # contact_id        = ""     # string | computed
  # delivery_address = [  # list(object)
  #   {
  #     simple_address = ""
  #   }
  # ]
  # name              = ""     # string | computed
  # type              = ""     # string | computed

}

