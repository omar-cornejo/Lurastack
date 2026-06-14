# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_default_object_access_control        │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_default_object_access_control" "this" {

  bucket       = ""     # string | required | The name of the bucket.
  entity       = ""     # string | required | The entity holding the permission, in one of the following f…
  role         = ""     # string | required | The access permission for the entity. Possible values: ["OWN…
  id           = ""     # string | optional+computed
  object       = ""     # string | optional | The name of the object, if applied to an object.

  # domain       = ""     # string | computed | The domain associated with the entity.
  # email        = ""     # string | computed | The email address associated with the entity.
  # entity_id    = ""     # string | computed | The ID for the entity
  # generation   = 0      # number | computed | The content generation of the object, if applied to an objec…
  # project_team = [  # list(object)
  #   {
  #     project_number = ""
  #     team = ""
  #   }
  # ]

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

