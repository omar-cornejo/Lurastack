# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_index_endpoint                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_index_endpoint" "this" {

  display_name                = ""     # string | required | The display name of the Index. The name can be up to 128 cha…
  description                 = ""     # string | optional | The description of the Index.
  id                          = ""     # string | optional+computed
  labels                      = {}     # map(string) | optional | The labels with user-defined metadata to organize your Index…
  network                     = ""     # string | optional | The full name of the Google Compute Engine [network](https:/…
  project                     = ""     # string | optional+computed
  public_endpoint_enabled     = false  # bool | optional | If true, the deployed index will be accessible through publi…
  region                      = ""     # string | optional | The region of the index endpoint. eg us-central1

  # create_time                 = ""     # string | computed | The timestamp of when the Index was created in RFC3339 UTC "…
  # effective_labels            = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                        = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # name                        = ""     # string | computed | The resource name of the Index.
  # public_endpoint_domain_name = ""     # string | computed | If publicEndpointEnabled is true, this field will be populat…
  # terraform_labels            = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                 = ""     # string | computed | The timestamp of when the Index was last updated in RFC3339 …

  private_service_connect_config { # list [0..1]
    enable_private_service_connect = false  # bool | required | If set to true, the IndexEndpoint is created without private…
    project_allowlist              = []     # list(string) | optional | A list of Projects from which the forwarding rule will targe…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

