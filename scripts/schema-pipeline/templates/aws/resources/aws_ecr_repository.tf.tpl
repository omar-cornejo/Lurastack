# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_repository                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_repository" "this" {

  name                 = ""     # string | required
  force_delete         = false  # bool | optional
  id                   = ""     # string | optional+computed
  image_tag_mutability = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # registry_id          = ""     # string | computed
  # repository_url       = ""     # string | computed

  encryption_configuration { # list
    encryption_type = ""     # string | optional
    kms_key         = ""     # string | optional+computed

  }

  image_scanning_configuration { # list [0..1]
    scan_on_push = false  # bool | required

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

