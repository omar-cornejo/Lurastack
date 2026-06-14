# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_object_copy                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_object_copy" "this" {

  bucket                        = ""     # string | required
  key                           = ""     # string | required
  source                        = ""     # string | required
  acl                           = ""     # string | optional+computed
  bucket_key_enabled            = false  # bool | optional+computed
  cache_control                 = ""     # string | optional+computed
  checksum_algorithm            = ""     # string | optional
  content_disposition           = ""     # string | optional+computed
  content_encoding              = ""     # string | optional+computed
  content_language              = ""     # string | optional+computed
  content_type                  = ""     # string | optional+computed
  copy_if_match                 = ""     # string | optional
  copy_if_modified_since        = ""     # string | optional
  copy_if_none_match            = ""     # string | optional
  copy_if_unmodified_since      = ""     # string | optional
  customer_algorithm            = ""     # string | optional+computed
  customer_key                  = ""     # string | optional+sensitive
  customer_key_md5              = ""     # string | optional+computed
  expected_bucket_owner         = ""     # string | optional
  expected_source_bucket_owner  = ""     # string | optional
  expires                       = ""     # string | optional
  force_destroy                 = false  # bool | optional
  id                            = ""     # string | optional+computed
  kms_encryption_context        = ""     # string | optional+computed+sensitive
  kms_key_id                    = ""     # string | optional+computed+sensitive
  metadata                      = {}     # map(string) | optional+computed
  metadata_directive            = ""     # string | optional
  object_lock_legal_hold_status = ""     # string | optional+computed
  object_lock_mode              = ""     # string | optional+computed
  object_lock_retain_until_date = ""     # string | optional+computed
  request_payer                 = ""     # string | optional
  server_side_encryption        = ""     # string | optional+computed
  source_customer_algorithm     = ""     # string | optional
  source_customer_key           = ""     # string | optional+sensitive
  source_customer_key_md5       = ""     # string | optional
  storage_class                 = ""     # string | optional+computed
  tagging_directive             = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  website_redirect              = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # checksum_crc32                = ""     # string | computed
  # checksum_crc32c               = ""     # string | computed
  # checksum_crc64nvme            = ""     # string | computed
  # checksum_sha1                 = ""     # string | computed
  # checksum_sha256               = ""     # string | computed
  # etag                          = ""     # string | computed
  # expiration                    = ""     # string | computed
  # last_modified                 = ""     # string | computed
  # request_charged               = false  # bool | computed
  # source_version_id             = ""     # string | computed
  # version_id                    = ""     # string | computed

  grant { # set
    permissions = []     # set(string) | required
    type        = ""     # string | required
    email       = ""     # string | optional
    id          = ""     # string | optional
    uri         = ""     # string | optional

  }

  override_provider { # list [0..1]

    default_tags { # list [0..1]
      tags = {}     # map(string) | optional

    }

  }

}

