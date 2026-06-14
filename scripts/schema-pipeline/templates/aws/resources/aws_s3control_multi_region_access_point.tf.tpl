# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_multi_region_access_point             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_multi_region_access_point" "this" {

  account_id  = ""     # string | optional+computed
  id          = ""     # string | optional+computed

  # alias       = ""     # string | computed
  # arn         = ""     # string | computed
  # domain_name = ""     # string | computed
  # status      = ""     # string | computed

  details { # list [1..1]
    name = ""     # string | required

    public_access_block { # list [0..1]
      block_public_acls       = false  # bool | optional
      block_public_policy     = false  # bool | optional
      ignore_public_acls      = false  # bool | optional
      restrict_public_buckets = false  # bool | optional

    }

    region { # set [1..20]
      bucket            = ""     # string | required
      bucket_account_id = ""     # string | optional+computed

      # region            = ""     # string | computed

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

