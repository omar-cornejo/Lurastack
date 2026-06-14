# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_region                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_region" "this" {

  directory_id                         = ""     # string | required
  region_name                          = ""     # string | required
  desired_number_of_domain_controllers = 0      # number | optional+computed
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_settings { # list [1..1]
    subnet_ids = []     # set(string) | required
    vpc_id     = ""     # string | required

  }

}

