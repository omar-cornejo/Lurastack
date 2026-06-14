# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_option_group                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_option_group" "this" {

  engine_name              = ""     # string | required
  major_engine_version     = ""     # string | required
  id                       = ""     # string | optional+computed
  name                     = ""     # string | optional+computed
  name_prefix              = ""     # string | optional+computed
  option_group_description = ""     # string | optional
  skip_destroy             = false  # bool | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed

  option { # set
    option_name                    = ""     # string | required
    db_security_group_memberships  = []     # set(string) | optional
    port                           = 0      # number | optional
    version                        = ""     # string | optional
    vpc_security_group_memberships = []     # set(string) | optional

    option_settings { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

