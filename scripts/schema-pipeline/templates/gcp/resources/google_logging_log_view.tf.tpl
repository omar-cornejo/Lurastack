# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_log_view                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_log_view" "this" {

  bucket      = ""     # string | required | The bucket of the resource
  name        = ""     # string | required | The resource name of the view. For example: \'projects/my-pr…
  description = ""     # string | optional | Describes this view.
  filter      = ""     # string | optional | Filter that restricts which log entries in a bucket are visi…
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed | The location of the resource. The supported locations are: g…
  parent      = ""     # string | optional+computed | The parent of the resource.

  # create_time = ""     # string | computed | Output only. The creation timestamp of the view.
  # update_time = ""     # string | computed | Output only. The last update timestamp of the view.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

