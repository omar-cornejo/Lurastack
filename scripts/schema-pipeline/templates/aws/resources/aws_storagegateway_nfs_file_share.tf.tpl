# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_nfs_file_share                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_nfs_file_share" "this" {

  client_list             = []     # set(string) | required
  gateway_arn             = ""     # string | required
  location_arn            = ""     # string | required
  role_arn                = ""     # string | required
  audit_destination_arn   = ""     # string | optional
  bucket_region           = ""     # string | optional
  default_storage_class   = ""     # string | optional
  file_share_name         = ""     # string | optional+computed
  guess_mime_type_enabled = false  # bool | optional
  id                      = ""     # string | optional+computed
  kms_encrypted           = false  # bool | optional
  kms_key_arn             = ""     # string | optional
  notification_policy     = ""     # string | optional
  object_acl              = ""     # string | optional
  read_only               = false  # bool | optional
  requester_pays          = false  # bool | optional
  squash                  = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed
  vpc_endpoint_dns_name   = ""     # string | optional

  # arn                     = ""     # string | computed
  # fileshare_id            = ""     # string | computed
  # path                    = ""     # string | computed

  cache_attributes { # list [0..1]
    cache_stale_timeout_in_seconds = 0      # number | optional

  }

  nfs_file_share_defaults { # list [0..1]
    directory_mode = ""     # string | optional
    file_mode      = ""     # string | optional
    group_id       = ""     # string | optional
    owner_id       = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

