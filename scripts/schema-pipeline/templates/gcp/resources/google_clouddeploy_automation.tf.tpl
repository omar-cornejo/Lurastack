# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_clouddeploy_automation                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_clouddeploy_automation" "this" {

  delivery_pipeline     = ""     # string | required | The delivery_pipeline for the resource
  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | Name of the 'Automation'.
  service_account       = ""     # string | required | Required. Email address of the user-managed IAM service acco…
  annotations           = {}     # map(string) | optional | Optional. User annotations. These attributes can only be set…
  description           = ""     # string | optional | Optional. Description of the 'Automation'. Max length is 255…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Optional. Labels are attributes that can be set and used by …
  project               = ""     # string | optional+computed
  suspended             = false  # bool | optional | Optional. When Suspended, automation is deactivated from exe…

  # create_time           = ""     # string | computed | Output only. Time at which the automation was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                  = ""     # string | computed | Optional. The weak etag of the 'Automation' resource. This c…
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Output only. Unique identifier of the 'Automation'.
  # update_time           = ""     # string | computed | Output only. Time at which the automation was updated.

  rules { # list [1..*]

    advance_rollout_rule { # list [0..1]
      id            = ""     # string | required | Required. ID of the rule. This id must be unique in the 'Aut…
      source_phases = []     # list(string) | optional | Optional. Proceeds only after phase name matched any one in …
      wait          = ""     # string | optional | Optional. How long to wait after a rollout is finished.

    }

    promote_release_rule { # list [0..1]
      id                    = ""     # string | required | Required. ID of the rule. This id must be unique in the 'Aut…
      destination_phase     = ""     # string | optional | Optional. The starting phase of the rollout created by this …
      destination_target_id = ""     # string | optional | Optional. The ID of the stage in the pipeline to which this …
      wait                  = ""     # string | optional | Optional. How long the release need to be paused until being…

    }

  }

  selector { # list [1..1]

    targets { # list [1..*]
      id     = ""     # string | optional | ID of the 'Target'. The value of this field could be one of …
      labels = {}     # map(string) | optional+computed | Target labels.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

