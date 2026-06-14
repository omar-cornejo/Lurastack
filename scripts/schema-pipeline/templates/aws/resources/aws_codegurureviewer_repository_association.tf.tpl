# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codegurureviewer_repository_association         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codegurureviewer_repository_association" "this" {

  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # association_id        = ""     # string | computed
  # connection_arn        = ""     # string | computed
  # name                  = ""     # string | computed
  # owner                 = ""     # string | computed
  # provider_type         = ""     # string | computed
  # s3_repository_details = [  # list(object)
  #   {
  #     bucket_name = ""
  #     code_artifacts = [  # list(object)
  #       {
  #         build_artifacts_object_key = ""
  #         source_code_artifacts_object_key = ""
  #       }
  #     ]
  #   }
  # ]
  # state                 = ""     # string | computed
  # state_reason          = ""     # string | computed

  kms_key_details { # list [0..1]
    encryption_option = ""     # string | optional
    kms_key_id        = ""     # string | optional

  }

  repository { # list [1..1]

    bitbucket { # list [0..1]
      connection_arn = ""     # string | required
      name           = ""     # string | required
      owner          = ""     # string | required

    }

    codecommit { # list [0..1]
      name = ""     # string | required

    }

    github_enterprise_server { # list [0..1]
      connection_arn = ""     # string | required
      name           = ""     # string | required
      owner          = ""     # string | required

    }

    s3_bucket { # list [0..1]
      bucket_name = ""     # string | required
      name        = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

