# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_email_identity_feedback_attributes        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_email_identity_feedback_attributes" "this" {

  email_identity           = ""     # string | required
  email_forwarding_enabled = false  # bool | optional
  id                       = ""     # string | optional+computed

}

