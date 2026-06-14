# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_run_v2_service                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_run_v2_service" "this" {

  location                = ""     # string | required | The location of the cloud run service
  name                    = ""     # string | required | Name of the Service.
  annotations             = {}     # map(string) | optional | Unstructured key value map that may be set by external tools…
  client                  = ""     # string | optional | Arbitrary identifier for the API client.
  client_version          = ""     # string | optional | Arbitrary version identifier for the API client.
  custom_audiences        = []     # list(string) | optional | One or more custom audiences that you want this service to s…
  description             = ""     # string | optional | User-provided description of the Service. This field current…
  id                      = ""     # string | optional+computed
  ingress                 = ""     # string | optional+computed | Provides the ingress settings for this Service. On output, r…
  labels                  = {}     # map(string) | optional | Unstructured key value map that can be used to organize and …
  launch_stage            = ""     # string | optional+computed | The launch stage as defined by [Google Cloud Platform Launch…
  project                 = ""     # string | optional+computed

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
  # create_time             = ""     # string | computed | The creation time.
  # creator                 = ""     # string | computed | Email address of the authenticated creator.
  # delete_time             = ""     # string | computed | The deletion time.
  # effective_annotations   = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels        = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                    = ""     # string | computed | A system-generated fingerprint for this version of the resou…
  # expire_time             = ""     # string | computed | For a deleted resource, the time after which it will be perm…
  # generation              = ""     # string | computed | A number that monotonically increases every time the user mo…
  # last_modifier           = ""     # string | computed | Email address of the last authenticated modifier.
  # latest_created_revision = ""     # string | computed | Name of the last created revision. See comments in reconcili…
  # latest_ready_revision   = ""     # string | computed | Name of the latest revision that is serving traffic. See com…
  # observed_generation     = ""     # string | computed | The generation of this Service currently serving traffic. Se…
  # reconciling             = false  # bool | computed | Returns true if the Service is currently being acted upon by…
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
  # terraform_labels        = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # traffic_statuses = [  # list(object)
  #   {
  #     percent = 0
  #     revision = ""
  #     tag = ""
  #     type = ""
  #     uri = ""
  #   }
  # ]
  # uid                     = ""     # string | computed | Server assigned unique identifier for the trigger. The value…
  # update_time             = ""     # string | computed | The last-modified time.
  # uri                     = ""     # string | computed | The main URI in which this Service is serving traffic.

  binary_authorization { # list [0..1]
    breakglass_justification = ""     # string | optional | If present, indicates to use Breakglass using this justifica…
    policy                   = ""     # string | optional | The path to a binary authorization policy. Format: projects/…
    use_default              = false  # bool | optional | If True, indicates to use the default project's binary autho…

  }

  template { # list [1..1]
    annotations                      = {}     # map(string) | optional | Unstructured key value map that may be set by external tools…
    encryption_key                   = ""     # string | optional | A reference to a customer managed encryption key (CMEK) to u…
    execution_environment            = ""     # string | optional | The sandbox environment to host this Revision. Possible valu…
    labels                           = {}     # map(string) | optional | Unstructured key value map that can be used to organize and …
    max_instance_request_concurrency = 0      # number | optional+computed | Sets the maximum number of requests that each serving instan…
    revision                         = ""     # string | optional | The unique name for the revision. If this field is omitted, …
    service_account                  = ""     # string | optional+computed | Email address of the IAM service account associated with the…
    session_affinity                 = false  # bool | optional | Enables session affinity. For more information, go to https:…
    timeout                          = ""     # string | optional+computed | Max allowed time for an instance to respond to a request.  A…

    containers { # list
      image       = ""     # string | required | URL of the Container image in Google Container Registry or G…
      args        = []     # list(string) | optional | Arguments to the entrypoint. The docker image's CMD is used …
      command     = []     # list(string) | optional | Entrypoint array. Not executed within a shell. The docker im…
      depends_on  = []     # list(string) | optional | Containers which should be started before this container. If…
      name        = ""     # string | optional | Name of the container specified as a DNS_LABEL.
      working_dir = ""     # string | optional | Container's working directory. If not specified, the contain…

      env { # list
        name  = ""     # string | required | Name of the environment variable. Must be a C_IDENTIFIER, an…
        value = ""     # string | optional | Literal value of the environment variable. Defaults to "" an…

        value_source { # list [0..1]

          secret_key_ref { # list [0..1]
            secret  = ""     # string | required | The name of the secret in Cloud Secret Manager. Format: {sec…
            version = ""     # string | optional | The Cloud Secret Manager secret version. Can be 'latest' for…

          }

        }

      }

      liveness_probe { # list [0..1]
        failure_threshold     = 0      # number | optional | Minimum consecutive failures for the probe to be considered …
        initial_delay_seconds = 0      # number | optional | Number of seconds after the container has started before the…
        period_seconds        = 0      # number | optional | How often (in seconds) to perform the probe. Default to 10 s…
        timeout_seconds       = 0      # number | optional | Number of seconds after which the probe times out. Defaults …

        grpc { # list [0..1]
          port    = 0      # number | optional+computed | Port number to access on the container. Number must be in th…
          service = ""     # string | optional | The name of the service to place in the gRPC HealthCheckRequ…

        }

        http_get { # list [0..1]
          path = ""     # string | optional | Path to access on the HTTP server. Defaults to '/'.
          port = 0      # number | optional+computed | Port number to access on the container. Number must be in th…

          http_headers { # list
            name  = ""     # string | required | The header field name
            value = ""     # string | optional | The header field value

          }

        }

        tcp_socket { # list [0..1]
          port = 0      # number | required | Port number to access on the container. Must be in the range…

        }

      }

      ports { # list [0..1]
        container_port = 0      # number | optional | Port number the container listens on. This must be a valid T…
        name           = ""     # string | optional+computed | If specified, used to specify which protocol to use. Allowed…

      }

      resources { # list [0..1]
        cpu_idle          = false  # bool | optional | Determines whether CPU is only allocated during requests. Tr…
        limits            = {}     # map(string) | optional+computed | Only memory and CPU are supported. Use key 'cpu' for CPU lim…
        startup_cpu_boost = false  # bool | optional | Determines whether CPU should be boosted on startup of a new…

      }

      startup_probe { # list [0..1]
        failure_threshold     = 0      # number | optional | Minimum consecutive failures for the probe to be considered …
        initial_delay_seconds = 0      # number | optional | Number of seconds after the container has started before the…
        period_seconds        = 0      # number | optional | How often (in seconds) to perform the probe. Default to 10 s…
        timeout_seconds       = 0      # number | optional | Number of seconds after which the probe times out. Defaults …

        grpc { # list [0..1]
          port    = 0      # number | optional+computed | Port number to access on the container. Number must be in th…
          service = ""     # string | optional | The name of the service to place in the gRPC HealthCheckRequ…

        }

        http_get { # list [0..1]
          path = ""     # string | optional | Path to access on the HTTP server. Defaults to '/'.
          port = 0      # number | optional+computed | Port number to access on the container. Must be in the range…

          http_headers { # list
            name  = ""     # string | required | The header field name
            value = ""     # string | optional | The header field value

          }

        }

        tcp_socket { # list [0..1]
          port = 0      # number | optional+computed | Port number to access on the container. Must be in the range…

        }

      }

      volume_mounts { # list
        mount_path = ""     # string | required | Path within the container at which the volume should be moun…
        name       = ""     # string | required | This must match the Name of a Volume.

      }

    }

    scaling { # list [0..1]
      max_instance_count = 0      # number | optional | Maximum number of serving instances that this resource shoul…
      min_instance_count = 0      # number | optional | Minimum number of serving instances that this resource shoul…

    }

    volumes { # list
      name = ""     # string | required | Volume's name.

      cloud_sql_instance { # list [0..1]
        instances = []     # set(string) | optional | The Cloud SQL instance connection names, as can be found in …

      }

      gcs { # list [0..1]
        bucket    = ""     # string | required | GCS Bucket name
        read_only = false  # bool | optional | If true, mount the GCS bucket as read-only

      }

      nfs { # list [0..1]
        path      = ""     # string | required | Path that is exported by the NFS server.
        server    = ""     # string | required | Hostname or IP address of the NFS server
        read_only = false  # bool | optional | If true, mount the NFS volume as read only

      }

      secret { # list [0..1]
        secret       = ""     # string | required | The name of the secret in Cloud Secret Manager. Format: {sec…
        default_mode = 0      # number | optional | Integer representation of mode bits to use on created files …

        items { # list
          path    = ""     # string | required | The relative path of the secret in the container.
          mode    = 0      # number | optional | Integer octal mode bits to use on this file, must be a value…
          version = ""     # string | optional | The Cloud Secret Manager secret version. Can be 'latest' for…

        }

      }

    }

    vpc_access { # list [0..1]
      connector = ""     # string | optional | VPC Access connector name. Format: projects/{project}/locati…
      egress    = ""     # string | optional+computed | Traffic VPC egress settings. Possible values: ["ALL_TRAFFIC"…

      network_interfaces { # list
        network    = ""     # string | optional+computed | The VPC network that the Cloud Run resource will be able to …
        subnetwork = ""     # string | optional+computed | The VPC subnetwork that the Cloud Run resource will get IPs …
        tags       = []     # list(string) | optional | Network tags applied to this Cloud Run service.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  traffic { # list
    percent  = 0      # number | optional+computed | Specifies percent of the traffic to this Revision. This defa…
    revision = ""     # string | optional | Revision to which to send this portion of traffic, if traffi…
    tag      = ""     # string | optional | Indicates a string to be part of the URI to exclusively refe…
    type     = ""     # string | optional | The allocation type for this traffic target. Possible values…

  }

}

