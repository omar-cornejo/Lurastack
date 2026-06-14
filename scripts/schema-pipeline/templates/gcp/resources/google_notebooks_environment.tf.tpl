# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_notebooks_environment                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_notebooks_environment" "this" {

  location            = ""     # string | required | A reference to the zone where the machine resides.
  name                = ""     # string | required | The name specified for the Environment instance. Format: pro…
  description         = ""     # string | optional | A brief description of this environment.
  display_name        = ""     # string | optional | Display name of this environment for the UI.
  id                  = ""     # string | optional+computed
  post_startup_script = ""     # string | optional | Path to a Bash script that automatically runs after a notebo…
  project             = ""     # string | optional+computed

  # create_time         = ""     # string | computed | Instance creation time

  container_image { # list [0..1]
    repository = ""     # string | required | The path to the container image repository. For example: gcr…
    tag        = ""     # string | optional | The tag of the container image. If not specified, this defau…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vm_image { # list [0..1]
    project      = ""     # string | required | The name of the Google Cloud project that this VM image belo…
    image_family = ""     # string | optional | Use this VM image family to find the image; the newest image…
    image_name   = ""     # string | optional | Use VM image name to find the image.

  }

}

