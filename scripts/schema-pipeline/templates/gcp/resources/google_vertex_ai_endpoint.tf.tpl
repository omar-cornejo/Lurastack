# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_endpoint                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_endpoint" "this" {

  display_name                    = ""     # string | required | Required. The display name of the Endpoint. The name can be …
  location                        = ""     # string | required | The location for the resource
  name                            = ""     # string | required | The resource name of the Endpoint. The name must be numeric …
  description                     = ""     # string | optional | The description of the Endpoint.
  id                              = ""     # string | optional+computed
  labels                          = {}     # map(string) | optional | The labels with user-defined metadata to organize your Endpo…
  network                         = ""     # string | optional | The full name of the Google Compute Engine [network](https:/…
  project                         = ""     # string | optional+computed
  region                          = ""     # string | optional | The region for the resource

  # create_time                     = ""     # string | computed | Output only. Timestamp when this Endpoint was created.
  # deployed_models = [  # list(object)
  #   {
  #     automatic_resources = [  # list(object)
  #       {
  #         max_replica_count = 0
  #         min_replica_count = 0
  #       }
  #     ]
  #     create_time = ""
  #     dedicated_resources = [  # list(object)
  #       {
  #         autoscaling_metric_specs = [  # list(object)
  #           {
  #             metric_name = ""
  #             target = 0
  #           }
  #         ]
  #         machine_spec = [  # list(object)
  #           {
  #             accelerator_count = 0
  #             accelerator_type = ""
  #             machine_type = ""
  #           }
  #         ]
  #         max_replica_count = 0
  #         min_replica_count = 0
  #       }
  #     ]
  #     display_name = ""
  #     enable_access_logging = false
  #     enable_container_logging = false
  #     id = ""
  #     model = ""
  #     model_version_id = ""
  #     private_endpoints = [  # list(object)
  #       {
  #         explain_http_uri = ""
  #         health_http_uri = ""
  #         predict_http_uri = ""
  #         service_attachment = ""
  #       }
  #     ]
  #     service_account = ""
  #     shared_resources = ""
  #   }
  # ]
  # effective_labels                = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                            = ""     # string | computed | Used to perform consistent read-modify-write updates. If not…
  # model_deployment_monitoring_job = ""     # string | computed | Output only. Resource name of the Model Monitoring job assoc…
  # terraform_labels                = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                     = ""     # string | computed | Output only. Timestamp when this Endpoint was last updated.

  encryption_spec { # list [0..1]
    kms_key_name = ""     # string | required | Required. The Cloud KMS resource identifier of the customer …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

