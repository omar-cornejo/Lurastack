# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_metastore_federation                │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_metastore_federation" "this" {

  federation_id    = ""     # string | required | The ID of the metastore federation. The id must contain only…
  version          = ""     # string | required | The Apache Hive metastore version of the federation. All bac…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for the metastore federation.  **Note**:…
  location         = ""     # string | optional | The location where the metastore federation should reside.
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # endpoint_uri     = ""     # string | computed | The URI of the endpoint used to access the metastore federat…
  # name             = ""     # string | computed | The relative resource name of the metastore federation.
  # state            = ""     # string | computed | The current state of the metastore federation.
  # state_message    = ""     # string | computed | Additional information about the current state of the metast…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | The globally unique resource identifier of the metastore fed…

  backend_metastores { # set [1..*]
    metastore_type = ""     # string | required | The type of the backend metastore. Possible values: ["METAST…
    name           = ""     # string | required | The relative resource name of the metastore that is being fe…
    rank           = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

