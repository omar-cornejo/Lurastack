# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_object_acl                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_object_acl" "this" {

  bucket         = ""     # string | required
  object         = ""     # string | required
  id             = ""     # string | optional+computed
  predefined_acl = ""     # string | optional
  role_entity    = []     # set(string) | optional+computed

}

