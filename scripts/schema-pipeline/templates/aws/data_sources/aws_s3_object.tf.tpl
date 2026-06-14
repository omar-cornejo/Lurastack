# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3_object                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_s3_object" "this" {

  bucket                        = ""     # string | required
  key                           = ""     # string | required
  checksum_mode                 = ""     # string | optional
  id                            = ""     # string | optional+computed
  range                         = ""     # string | optional
  tags                          = {}     # map(string) | optional+computed
  version_id                    = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # body                          = ""     # string | computed
  # bucket_key_enabled            = false  # bool | computed
  # cache_control                 = ""     # string | computed
  # checksum_crc32                = ""     # string | computed
  # checksum_crc32c               = ""     # string | computed
  # checksum_crc64nvme            = ""     # string | computed
  # checksum_sha1                 = ""     # string | computed
  # checksum_sha256               = ""     # string | computed
  # content_disposition           = ""     # string | computed
  # content_encoding              = ""     # string | computed
  # content_language              = ""     # string | computed
  # content_length                = 0      # number | computed
  # content_type                  = ""     # string | computed
  # etag                          = ""     # string | computed
  # expiration                    = ""     # string | computed
  # expires                       = ""     # string | computed
  # last_modified                 = ""     # string | computed
  # metadata                      = {}     # map(string) | computed
  # object_lock_legal_hold_status = ""     # string | computed
  # object_lock_mode              = ""     # string | computed
  # object_lock_retain_until_date = ""     # string | computed
  # server_side_encryption        = ""     # string | computed
  # sse_kms_key_id                = ""     # string | computed
  # storage_class                 = ""     # string | computed
  # website_redirect_location     = ""     # string | computed

}

