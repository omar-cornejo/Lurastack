# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_default_object_acl                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_default_object_acl" "this" {

  bucket      = ""     # string | required
  id          = ""     # string | optional+computed
  role_entity = []     # set(string) | optional+computed

}

