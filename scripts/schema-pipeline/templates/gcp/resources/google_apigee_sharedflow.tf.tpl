# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apigee_sharedflow                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_apigee_sharedflow" "this" {

  config_bundle      = ""     # string | required | Path to the config zip bundle
  name               = ""     # string | required | The ID of the shared flow.
  org_id             = ""     # string | required | The Apigee Organization name associated with the Apigee inst…
  detect_md5hash     = ""     # string | optional | A hash of local config bundle in string, user needs to use a…
  id                 = ""     # string | optional+computed

  # latest_revision_id = ""     # string | computed | The id of the most recently created revision for this shared…
  # md5hash            = ""     # string | computed | Base 64 MD5 hash of the uploaded config bundle.
  # meta_data = [  # list(object)
  #   {
  #     created_at = ""
  #     last_modified_at = ""
  #     sub_type = ""
  #   }
  # ]
  # revision           = []     # list(string) | computed | A list of revisions of this shared flow.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

