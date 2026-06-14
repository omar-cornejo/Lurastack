# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_run_v2_job                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_run_v2_job" "this" {

  location                 = ""     # string | required | The location of the cloud run job
  name                     = ""     # string | required | Name of the Job.
  annotations              = {}     # map(string) | optional | Unstructured key value map that may be set by external tools…
  client                   = ""     # string | optional | Arbitrary identifier for the API client.
  client_version           = ""     # string | optional | Arbitrary version identifier for the API client.
  id                       = ""     # string | optional+computed
  labels                   = {}     # map(string) | optional | Unstructured key value map that can be used to organize and …
  launch_stage             = ""     # string | optional+computed | The launch stage as defined by [Google Cloud Platform Launch…
  project                  = ""     # string | optional+computed

  # conditions = [  # list(object)
  #   {
  #     execution_reason = ""
  #     last_transition_time = ""
  #     message = ""
  #     reason = ""
  #     revision_reason = ""
  #     severity = ""
  #     state = ""
  #     type = ""
  #   }
  # ]
  # create_time              = ""     # string | computed | The creation time.
  # creator                  = ""     # string | computed | Email address of the authenticated creator.
  # delete_time              = ""     # string | computed | The deletion time.
  # effective_annotations    = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels         = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                     = ""     # string | computed | A system-generated fingerprint for this version of the resou…
  # execution_count          = 0      # number | computed | Number of executions created for this job.
  # expire_time              = ""     # string | computed | For a deleted resource, the time after which it will be perm…
  # generation               = ""     # string | computed | A number that monotonically increases every time the user mo…
  # last_modifier            = ""     # string | computed | Email address of the last authenticated modifier.
  # latest_created_execution = [  # list(object)
  #   {
  #     completion_time = ""
  #     create_time = ""
  #     name = ""
  #   }
  # ]
  # observed_generation      = ""     # string | computed | The generation of this Job. See comments in reconciling for …
  # reconciling              = false  # bool | computed | Returns true if the Job is currently being acted upon by the…
  # terminal_condition = [  # list(object)
  #   {
  #     execution_reason = ""
  #     last_transition_time = ""
  #     message = ""
  #     reason = ""
  #     revision_reason = ""
  #     severity = ""
  #     state = ""
  #     type = ""
  #   }
  # ]
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                      = ""     # string | computed | Server assigned unique identifier for the Execution. The val…
  # update_time              = ""     # string | computed | The last-modified time.

  binary_authorization { # list [0..1]
    breakglass_justification = ""     # string | optional | If present, indicates to use Breakglass using this justifica…
    policy                   = ""     # string | optional | The path to a binary authorization policy. Format: projects/…
    use_default              = false  # bool | optional | If True, indicates to use the default project's binary autho…

  }

  template { # list [1..1]
    annotations = {}     # map(string) | optional | Unstructured key value map that may be set by external tools…
    labels      = {}     # map(string) | optional | Unstructured key value map that can be used to organize and …
    parallelism = 0      # number | optional+computed | Specifies the maximum desired number of tasks the execution …
    task_count  = 0      # number | optional+computed | Specifies the desired number of tasks the execution should r…

    template { # list [1..1]
      encryption_key        = ""     # string | optional | A reference to a customer managed encryption key (CMEK) to u…
      execution_environment = ""     # string | optional+computed | The execution environment being used to host this Task. Poss…
      max_retries           = 0      # number | optional | Number of retries allowed per Task, before marking this Task…
      service_account       = ""     # string | optional+computed | Email address of the IAM service account associated with the…
      timeout               = ""     # string | optional+computed | Max allowed time duration the Task may be active before the …

      containers { # list
        image       = ""     # string | required | URL of the Container image in Google Container Registry or G…
        args        = []     # list(string) | optional | Arguments to the entrypoint. The docker image's CMD is used …
        command     = []     # list(string) | optional | Entrypoint array. Not executed within a shell. The docker im…
        name        = ""     # string | optional | Name of the container specified as a DNS_LABEL.
        working_dir = ""     # string | optional | Container's working directory. If not specified, the contain…

        env { # list
          name  = ""     # string | required | Name of the environment variable. Must be a C_IDENTIFIER, an…
          value = ""     # string | optional | Literal value of the environment variable. Defaults to "" an…

          value_source { # list [0..1]

            secret_key_ref { # list [0..1]
              secret  = ""     # string | required | The name of the secret in Cloud Secret Manager. Format: {sec…
              version = ""     # string | required | The Cloud Secret Manager secret version. Can be 'latest' for…

            }

          }

        }

        ports { # list
          container_port = 0      # number | optional | Port number the container listens on. This must be a valid T…
          name           = ""     # string | optional | If specified, used to specify which protocol to use. Allowed…

        }

        resources { # list [0..1]
          limits = {}     # map(string) | optional+computed | Only memory and CPU are supported. Use key 'cpu' for CPU lim…

        }

        volume_mounts { # list
          mount_path = ""     # string | required | Path within the container at which the volume should be moun…
          name       = ""     # string | required | This must match the Name of a Volume.

        }

      }

      volumes { # list
        name = ""     # string | required | Volume's name.

        cloud_sql_instance { # list [0..1]
          instances = []     # list(string) | optional | The Cloud SQL instance connection names, as can be found in …

        }

        secret { # list [0..1]
          secret       = ""     # string | required | The name of the secret in Cloud Secret Manager. Format: {sec…
          default_mode = 0      # number | optional | Integer representation of mode bits to use on created files …

          items { # list
            path    = ""     # string | required | The relative path of the secret in the container.
            version = ""     # string | required | The Cloud Secret Manager secret version. Can be 'latest' for…
            mode    = 0      # number | optional | Integer octal mode bits to use on this file, must be a value…

          }

        }

      }

      vpc_access { # list [0..1]
        connector = ""     # string | optional | VPC Access connector name. Format: projects/{project}/locati…
        egress    = ""     # string | optional+computed | Traffic VPC egress settings. Possible values: ["ALL_TRAFFIC"…

        network_interfaces { # list
          network    = ""     # string | optional+computed | The VPC network that the Cloud Run resource will be able to …
          subnetwork = ""     # string | optional+computed | The VPC subnetwork that the Cloud Run resource will get IPs …
          tags       = []     # list(string) | optional | Network tags applied to this Cloud Run job.

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

