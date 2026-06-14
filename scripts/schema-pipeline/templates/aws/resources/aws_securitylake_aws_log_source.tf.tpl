# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securitylake_aws_log_source                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securitylake_aws_log_source" "this" {


  # id = ""     # string | computed

  source { # list
    regions        = []     # set(string) | required
    source_name    = ""     # string | required
    accounts       = []     # set(string) | optional+computed
    source_version = ""     # string | optional+computed

  }

}

