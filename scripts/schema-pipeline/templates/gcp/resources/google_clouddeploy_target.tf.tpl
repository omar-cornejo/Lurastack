# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_clouddeploy_target                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_clouddeploy_target" "this" {

  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | Name of the `Target`. Format is `[a-z]([a-z0-9-]{0,61}[a-z0-…
  annotations           = {}     # map(string) | optional | Optional. User annotations. These attributes can only be set…
  deploy_parameters     = {}     # map(string) | optional | Optional. The deploy parameters to use for this target.
  description           = ""     # string | optional | Optional. Description of the `Target`. Max length is 255 cha…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Optional. Labels are attributes that can be set and used by …
  project               = ""     # string | optional+computed | The project for the resource
  require_approval      = false  # bool | optional | Optional. Whether or not the `Target` requires approval.

  # create_time           = ""     # string | computed | Output only. Time at which the `Target` was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                  = ""     # string | computed | Optional. This checksum is computed by the server based on t…
  # target_id             = ""     # string | computed | Output only. Resource id of the `Target`.
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Output only. Unique identifier of the `Target`.
  # update_time           = ""     # string | computed | Output only. Most recent time at which the `Target` was upda…

  anthos_cluster { # list [0..1]
    membership = ""     # string | optional | Membership of the GKE Hub-registered cluster to which to app…

  }

  custom_target { # list [0..1]
    custom_target_type = ""     # string | required | Required. The name of the CustomTargetType. Format must be `…

  }

  execution_configs { # list
    usages            = []     # list(string) | required | Required. Usages when this configuration should be applied.
    artifact_storage  = ""     # string | optional+computed | Optional. Cloud Storage location in which to store execution…
    execution_timeout = ""     # string | optional+computed | Optional. Execution timeout for a Cloud Build Execution. Thi…
    service_account   = ""     # string | optional+computed | Optional. Google service account to use for execution. If un…
    verbose           = false  # bool | optional | Optional. If true, additional logging will be enabled when r…
    worker_pool       = ""     # string | optional | Optional. The resource name of the `WorkerPool`, with the fo…

  }

  gke { # list [0..1]
    cluster     = ""     # string | optional | Information specifying a GKE Cluster. Format is `projects/{p…
    internal_ip = false  # bool | optional | Optional. If true, `cluster` is accessed using the private I…
    proxy_url   = ""     # string | optional | Optional. If set, used to configure a [proxy](https://kubern…

  }

  multi_target { # list [0..1]
    target_ids = []     # list(string) | required | Required. The target_ids of this multiTarget.

  }

  run { # list [0..1]
    location = ""     # string | required | Required. The location where the Cloud Run Service should be…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

