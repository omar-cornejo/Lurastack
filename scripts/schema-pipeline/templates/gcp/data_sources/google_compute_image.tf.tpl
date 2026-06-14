# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_image                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_image" "this" {

  family                            = ""     # string | optional+computed
  filter                            = ""     # string | optional
  id                                = ""     # string | optional+computed
  most_recent                       = false  # bool | optional
  name                              = ""     # string | optional+computed
  project                           = ""     # string | optional+computed

  # archive_size_bytes                = 0      # number | computed
  # creation_timestamp                = ""     # string | computed
  # description                       = ""     # string | computed
  # disk_size_gb                      = 0      # number | computed
  # image_encryption_key_sha256       = ""     # string | computed
  # image_id                          = ""     # string | computed
  # label_fingerprint                 = ""     # string | computed
  # labels                            = {}     # map(string) | computed
  # licenses                          = []     # list(string) | computed
  # self_link                         = ""     # string | computed
  # source_disk                       = ""     # string | computed
  # source_disk_encryption_key_sha256 = ""     # string | computed
  # source_disk_id                    = ""     # string | computed
  # source_image_id                   = ""     # string | computed
  # status                            = ""     # string | computed

}

