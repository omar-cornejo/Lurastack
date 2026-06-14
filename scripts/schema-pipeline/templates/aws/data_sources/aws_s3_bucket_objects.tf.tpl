# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3_bucket_objects                                   │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
data "aws_s3_bucket_objects" "this" {

  bucket          = ""     # string | required+DEPRECATED
  delimiter       = ""     # string | optional
  encoding_type   = ""     # string | optional
  fetch_owner     = false  # bool | optional
  id              = ""     # string | optional+computed
  max_keys        = 0      # number | optional
  prefix          = ""     # string | optional
  start_after     = ""     # string | optional

  # common_prefixes = []     # list(string) | computed
  # keys            = []     # list(string) | computed
  # owners          = []     # list(string) | computed

}

