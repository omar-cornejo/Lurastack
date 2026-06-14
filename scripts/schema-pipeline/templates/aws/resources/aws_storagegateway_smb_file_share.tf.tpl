# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_smb_file_share                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_smb_file_share" "this" {

  gateway_arn              = ""     # string | required
  location_arn             = ""     # string | required
  role_arn                 = ""     # string | required
  access_based_enumeration = false  # bool | optional
  admin_user_list          = []     # set(string) | optional
  audit_destination_arn    = ""     # string | optional
  authentication           = ""     # string | optional
  bucket_region            = ""     # string | optional
  case_sensitivity         = ""     # string | optional
  default_storage_class    = ""     # string | optional
  file_share_name          = ""     # string | optional+computed
  guess_mime_type_enabled  = false  # bool | optional
  id                       = ""     # string | optional+computed
  invalid_user_list        = []     # set(string) | optional
  kms_encrypted            = false  # bool | optional
  kms_key_arn              = ""     # string | optional
  notification_policy      = ""     # string | optional
  object_acl               = ""     # string | optional
  oplocks_enabled          = false  # bool | optional+computed
  read_only                = false  # bool | optional
  requester_pays           = false  # bool | optional
  smb_acl_enabled          = false  # bool | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  valid_user_list          = []     # set(string) | optional
  vpc_endpoint_dns_name    = ""     # string | optional

  # arn                      = ""     # string | computed
  # fileshare_id             = ""     # string | computed
  # path                     = ""     # string | computed

  cache_attributes { # list [0..1]
    cache_stale_timeout_in_seconds = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

