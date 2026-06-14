# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudbuildv2_repository                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudbuildv2_repository" "this" {

  name                  = ""     # string | required | Name of the repository.
  parent_connection     = ""     # string | required | The connection for the resource
  remote_uri            = ""     # string | required | Required. Git Clone HTTPS URI.
  annotations           = {}     # map(string) | optional | Allows clients to store small amounts of arbitrary data.  **…
  id                    = ""     # string | optional+computed
  location              = ""     # string | optional+computed | The location for the resource
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Output only. Server assigned timestamp for when the connecti…
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # update_time           = ""     # string | computed | Output only. Server assigned timestamp for when the connecti…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

