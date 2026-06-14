# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_object                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_object" "this" {

  bucket                        = ""     # string | required
  key                           = ""     # string | required
  acl                           = ""     # string | optional+computed
  bucket_key_enabled            = false  # bool | optional+computed
  cache_control                 = ""     # string | optional
  checksum_algorithm            = ""     # string | optional
  content                       = ""     # string | optional
  content_base64                = ""     # string | optional
  content_disposition           = ""     # string | optional
  content_encoding              = ""     # string | optional
  content_language              = ""     # string | optional
  content_type                  = ""     # string | optional+computed
  etag                          = ""     # string | optional+computed
  force_destroy                 = false  # bool | optional
  id                            = ""     # string | optional+computed
  kms_key_id                    = ""     # string | optional+computed
  metadata                      = {}     # map(string) | optional
  object_lock_legal_hold_status = ""     # string | optional
  object_lock_mode              = ""     # string | optional
  object_lock_retain_until_date = ""     # string | optional
  server_side_encryption        = ""     # string | optional+computed
  source                        = ""     # string | optional
  source_hash                   = ""     # string | optional
  storage_class                 = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  website_redirect              = ""     # string | optional

  # arn                           = ""     # string | computed
  # checksum_crc32                = ""     # string | computed
  # checksum_crc32c               = ""     # string | computed
  # checksum_crc64nvme            = ""     # string | computed
  # checksum_sha1                 = ""     # string | computed
  # checksum_sha256               = ""     # string | computed
  # version_id                    = ""     # string | computed

  override_provider { # list [0..1]

    default_tags { # list [0..1]
      tags = {}     # map(string) | optional

    }

  }

}

