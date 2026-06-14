# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_organizations_features                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_organizations_features" "this" {

  enabled_features = []     # set(string) | required

  # id               = ""     # string | computed

}

