# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_eventarc_trigger                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_eventarc_trigger" "this" {

  location                = ""     # string | required | The location for the resource
  name                    = ""     # string | required | Required. The resource name of the trigger. Must be unique w…
  channel                 = ""     # string | optional | Optional. The name of the channel associated with the trigge…
  event_data_content_type = ""     # string | optional+computed | Optional. EventDataContentType specifies the type of payload…
  id                      = ""     # string | optional+computed
  labels                  = {}     # map(string) | optional | Optional. User labels attached to the triggers that can be u…
  project                 = ""     # string | optional+computed | The project for the resource
  service_account         = ""     # string | optional | Optional. The IAM service account email associated with the …

  # conditions              = {}     # map(string) | computed | Output only. The reason(s) why a trigger is in FAILED state.
  # create_time             = ""     # string | computed | Output only. The creation time.
  # effective_labels        = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                    = ""     # string | computed | Output only. This checksum is computed by the server based o…
  # terraform_labels        = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                     = ""     # string | computed | Output only. Server assigned unique identifier for the trigg…
  # update_time             = ""     # string | computed | Output only. The last-modified time.

  destination { # list [1..1]
    workflow       = ""     # string | optional | The resource name of the Workflow whose Executions are trigg…

    # cloud_function = ""     # string | computed | The Cloud Function resource name. Only Cloud Functions V2 is…

    cloud_run_service { # list [0..1]
      service = ""     # string | required | Required. The name of the Cloud Run service being addressed.…
      path    = ""     # string | optional | Optional. The relative path on the Cloud Run service the eve…
      region  = ""     # string | optional+computed | Required. The region the Cloud Run service is deployed in.

    }

    gke { # list [0..1]
      cluster   = ""     # string | required | Required. The name of the cluster the GKE service is running…
      location  = ""     # string | required | Required. The name of the Google Compute Engine in which the…
      namespace = ""     # string | required | Required. The namespace the GKE service is running in.
      service   = ""     # string | required | Required. Name of the GKE service.
      path      = ""     # string | optional | Optional. The relative path on the GKE service the events sh…

    }

    http_endpoint { # list [0..1]
      uri = ""     # string | required | Required. The URI of the HTTP enpdoint. The value must be a …

    }

    network_config { # list [0..1]
      network_attachment = ""     # string | required | Required. Name of the NetworkAttachment that allows access t…

    }

  }

  matching_criteria { # set [1..*]
    attribute = ""     # string | required | Required. The name of a CloudEvents attribute. Currently, on…
    value     = ""     # string | required | Required. The value for the attribute. See https://cloud.goo…
    operator  = ""     # string | optional | Optional. The operator used for matching the events with the…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  transport { # list [0..1]

    pubsub { # list [0..1]
      topic        = ""     # string | optional | Optional. The name of the Pub/Sub topic created and managed …

      # subscription = ""     # string | computed | Output only. The name of the Pub/Sub subscription created an…

    }

  }

}

