# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_asset_folder_feed                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_asset_folder_feed" "this" {

  billing_project = ""     # string | required | The project whose identity will be used when sending message…
  feed_id         = ""     # string | required | This is the client-assigned asset feed identifier and it nee…
  folder          = ""     # string | required | The folder this feed should be created in.
  asset_names     = []     # list(string) | optional | A list of the full names of the assets to receive updates. Y…
  asset_types     = []     # list(string) | optional | A list of types of the assets to receive updates. You must s…
  content_type    = ""     # string | optional | Asset content type. If not specified, no content but the ass…
  id              = ""     # string | optional+computed

  # folder_id       = ""     # string | computed | The ID of the folder where this feed has been created. Both …
  # name            = ""     # string | computed | The format will be folders/{folder_number}/feeds/{client-ass…

  condition { # list [0..1]
    expression  = ""     # string | required | Textual representation of an expression in Common Expression…
    description = ""     # string | optional | Description of the expression. This is a longer text which d…
    location    = ""     # string | optional | String indicating the location of the expression for error r…
    title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

  }

  feed_output_config { # list [1..1]

    pubsub_destination { # list [1..1]
      topic = ""     # string | required | Destination on Cloud Pubsub topic.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

