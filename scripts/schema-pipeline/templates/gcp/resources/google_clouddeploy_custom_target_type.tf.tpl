# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_clouddeploy_custom_target_type               │
# └──────────────────────────────────────────────────────────────┘
resource "google_clouddeploy_custom_target_type" "this" {

  location              = ""     # string | required | The location of the source.
  name                  = ""     # string | required | Name of the 'CustomTargetType'.
  annotations           = {}     # map(string) | optional | User annotations. These attributes can only be set and used …
  description           = ""     # string | optional | Description of the 'CustomTargetType'. Max length is 255 cha…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Labels are attributes that can be set and used by both the u…
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | Time at which the 'CustomTargetType' was created.
  # custom_target_type_id = ""     # string | computed | Resource id of the 'CustomTargetType'.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                  = ""     # string | computed | The weak etag of the 'CustomTargetType' resource. This check…
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Unique identifier of the 'CustomTargetType'.
  # update_time           = ""     # string | computed | Time at which the 'CustomTargetType' was updated.

  custom_actions { # list [0..1]
    deploy_action = ""     # string | required | The Skaffold custom action responsible for deploy operations…
    render_action = ""     # string | optional | The Skaffold custom action responsible for render operations…

    include_skaffold_modules { # list
      configs = []     # list(string) | optional | The Skaffold Config modules to use from the specified source…

      git { # list [0..1]
        repo = ""     # string | required | Git repository the package should be cloned from.
        path = ""     # string | optional | Relative path from the repository root to the Skaffold file.
        ref  = ""     # string | optional | Git ref the package should be cloned from.

      }

      google_cloud_build_repo { # list [0..1]
        repository = ""     # string | required | Cloud Build 2nd gen repository in the format of 'projects/<p…
        path       = ""     # string | optional | Relative path from the repository root to the Skaffold file.
        ref        = ""     # string | optional | Branch or tag to use when cloning the repository.

      }

      google_cloud_storage { # list [0..1]
        source = ""     # string | required | Cloud Storage source paths to copy recursively. For example,…
        path   = ""     # string | optional | Relative path from the source to the Skaffold file.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

