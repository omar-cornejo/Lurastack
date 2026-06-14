# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_clouddeploy_delivery_pipeline                │
# └──────────────────────────────────────────────────────────────┘
resource "google_clouddeploy_delivery_pipeline" "this" {

  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | Name of the `DeliveryPipeline`. Format is `[a-z]([a-z0-9-]{0…
  annotations           = {}     # map(string) | optional | User annotations. These attributes can only be set and used …
  description           = ""     # string | optional | Description of the `DeliveryPipeline`. Max length is 255 cha…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Labels are attributes that can be set and used by both the u…
  project               = ""     # string | optional+computed | The project for the resource
  suspended             = false  # bool | optional | When suspended, no new releases or rollouts can be created, …

  # condition = [  # list(object)
  #   {
  #     pipeline_ready_condition = [  # list(object)
  #       {
  #         status = false
  #         update_time = ""
  #       }
  #     ]
  #     targets_present_condition = [  # list(object)
  #       {
  #         missing_targets = []  # list(string)
  #         status = false
  #         update_time = ""
  #       }
  #     ]
  #     targets_type_condition = [  # list(object)
  #       {
  #         error_details = ""
  #         status = false
  #       }
  #     ]
  #   }
  # ]
  # create_time           = ""     # string | computed | Output only. Time at which the pipeline was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Output only. Unique identifier of the `DeliveryPipeline`.
  # update_time           = ""     # string | computed | Output only. Most recent time at which the pipeline was upda…

  serial_pipeline { # list [0..1]

    stages { # list
      profiles  = []     # list(string) | optional | Skaffold profiles to use when rendering the manifest for thi…
      target_id = ""     # string | optional | The target_id to which this stage points. This field refers …

      deploy_parameters { # list
        values              = {}     # map(string) | required | Required. Values are deploy parameters in key-value pairs.
        match_target_labels = {}     # map(string) | optional | Optional. Deploy parameters are applied to targets with matc…

      }

      strategy { # list [0..1]

        canary { # list [0..1]

          canary_deployment { # list [0..1]
            percentages = []     # list(number) | required | Required. The percentage based deployments that will occur a…
            verify      = false  # bool | optional | Whether to run verify tests after each percentage deployment…

            postdeploy { # list [0..1]
              actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

            }

            predeploy { # list [0..1]
              actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

            }

          }

          custom_canary_deployment { # list [0..1]

            phase_configs { # list [1..*]
              percentage = 0      # number | required | Required. Percentage deployment for the phase.
              phase_id   = ""     # string | required | Required. The ID to assign to the `Rollout` phase. This valu…
              profiles   = []     # list(string) | optional | Skaffold profiles to use when rendering the manifest for thi…
              verify     = false  # bool | optional | Whether to run verify tests after the deployment.

              postdeploy { # list [0..1]
                actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

              }

              predeploy { # list [0..1]
                actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

              }

            }

          }

          runtime_config { # list [0..1]

            cloud_run { # list [0..1]
              automatic_traffic_control = false  # bool | optional | Whether Cloud Deploy should update the traffic stanza in a C…
              canary_revision_tags      = []     # list(string) | optional | Optional. A list of tags that are added to the canary revisi…
              prior_revision_tags       = []     # list(string) | optional | Optional. A list of tags that are added to the prior revisio…
              stable_revision_tags      = []     # list(string) | optional | Optional. A list of tags that are added to the final stable …

            }

            kubernetes { # list [0..1]

              gateway_service_mesh { # list [0..1]
                deployment              = ""     # string | required | Required. Name of the Kubernetes Deployment whose traffic is…
                http_route              = ""     # string | required | Required. Name of the Gateway API HTTPRoute.
                service                 = ""     # string | required | Required. Name of the Kubernetes Service.
                pod_selector_label      = ""     # string | optional | Optional. The label to use when selecting Pods for the Deplo…
                route_update_wait_time  = ""     # string | optional | Optional. The time to wait for route updates to propagate. T…
                stable_cutback_duration = ""     # string | optional | Optional. The amount of time to migrate traffic back from th…

              }

              service_networking { # list [0..1]
                deployment                   = ""     # string | required | Required. Name of the Kubernetes Deployment whose traffic is…
                service                      = ""     # string | required | Required. Name of the Kubernetes Service.
                disable_pod_overprovisioning = false  # bool | optional | Optional. Whether to disable Pod overprovisioning. If Pod ov…
                pod_selector_label           = ""     # string | optional | Optional. The label to use when selecting Pods for the Deplo…

              }

            }

          }

        }

        standard { # list [0..1]
          verify = false  # bool | optional | Whether to verify a deployment.

          postdeploy { # list [0..1]
            actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

          }

          predeploy { # list [0..1]
            actions = []     # list(string) | optional | Optional. A sequence of skaffold custom actions to invoke du…

          }

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

