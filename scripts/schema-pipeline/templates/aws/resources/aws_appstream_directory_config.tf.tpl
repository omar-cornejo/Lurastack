# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_directory_config                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_directory_config" "this" {

  directory_name                          = ""     # string | required
  organizational_unit_distinguished_names = []     # set(string) | required
  id                                      = ""     # string | optional+computed

  # created_time                            = ""     # string | computed

  service_account_credentials { # list [1..1]
    account_name     = ""     # string | required
    account_password = ""     # string | required+sensitive

  }

}

