# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_bucket_acl                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_bucket_acl" "this" {

  bucket         = ""     # string | required | The name of the bucket it applies to.
  default_acl    = ""     # string | optional | Configure this ACL to be the default ACL.
  id             = ""     # string | optional+computed
  predefined_acl = ""     # string | optional | The canned GCS ACL to apply. Must be set if role_entity is n…
  role_entity    = []     # list(string) | optional+computed | List of role/entity pairs in the form ROLE:entity. See GCS B…

}

