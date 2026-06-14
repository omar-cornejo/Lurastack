# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_flexible_app_version              │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_flexible_app_version" "this" {

  runtime                      = ""     # string | required | Desired runtime. Example python27.
  service                      = ""     # string | required | AppEngine service resource. Can contain numbers, letters, an…
  beta_settings                = {}     # map(string) | optional | Metadata settings that are supplied to this version to enabl…
  default_expiration           = ""     # string | optional | Duration that static files should be cached by web proxies a…
  delete_service_on_destroy    = false  # bool | optional | If set to 'true', the service will be deleted if it is the l…
  env_variables                = {}     # map(string) | optional | Environment variables available to the application.  As thes…
  id                           = ""     # string | optional+computed
  inbound_services             = []     # set(string) | optional | A list of the types of messages that this application is abl…
  instance_class               = ""     # string | optional | Instance class that is used to run this version. Valid value…
  nobuild_files_regex          = ""     # string | optional | Files that match this pattern will not be built into this ve…
  noop_on_destroy              = false  # bool | optional | If set to 'true', the application version will not be delete…
  project                      = ""     # string | optional+computed
  runtime_api_version          = ""     # string | optional+computed | The version of the API in the given runtime environment. Ple…
  runtime_channel              = ""     # string | optional | The channel of the runtime to use. Only available for some r…
  runtime_main_executable_path = ""     # string | optional | The path or name of the app's main executable.
  service_account              = ""     # string | optional+computed | The identity that the deployed version will run as. Admin AP…
  serving_status               = ""     # string | optional | Current serving status of this version. Only the versions wi…
  version_id                   = ""     # string | optional | Relative name of the version within the service. For example…

  # name                         = ""     # string | computed | Full path to the Version resource in the API. Example, "v1".

  api_config { # list [0..1]
    script           = ""     # string | required | Path to the script from the application root directory.
    auth_fail_action = ""     # string | optional | Action to take when users access resources that require auth…
    login            = ""     # string | optional | Level of login required to access this resource. Default val…
    security_level   = ""     # string | optional | Security (HTTPS) enforcement for this URL. Possible values: …
    url              = ""     # string | optional | URL to serve the endpoint at.

  }

  automatic_scaling { # list [0..1]
    cool_down_period        = ""     # string | optional | The time period that the Autoscaler should wait before it st…
    max_concurrent_requests = 0      # number | optional+computed | Number of concurrent requests an automatic scaling instance …
    max_idle_instances      = 0      # number | optional | Maximum number of idle instances that should be maintained f…
    max_pending_latency     = ""     # string | optional | Maximum amount of time that a request should wait in the pen…
    max_total_instances     = 0      # number | optional | Maximum number of instances that should be started to handle…
    min_idle_instances      = 0      # number | optional | Minimum number of idle instances that should be maintained f…
    min_pending_latency     = ""     # string | optional | Minimum amount of time a request should wait in the pending …
    min_total_instances     = 0      # number | optional | Minimum number of running instances that should be maintaine…

    cpu_utilization { # list [1..1]
      target_utilization        = 0      # number | required | Target CPU utilization ratio to maintain when scaling. Must …
      aggregation_window_length = ""     # string | optional | Period of time over which CPU utilization is calculated.

    }

    disk_utilization { # list [0..1]
      target_read_bytes_per_second  = 0      # number | optional | Target bytes read per second.
      target_read_ops_per_second    = 0      # number | optional | Target ops read per seconds.
      target_write_bytes_per_second = 0      # number | optional | Target bytes written per second.
      target_write_ops_per_second   = 0      # number | optional | Target ops written per second.

    }

    network_utilization { # list [0..1]
      target_received_bytes_per_second   = 0      # number | optional | Target bytes received per second.
      target_received_packets_per_second = 0      # number | optional | Target packets received per second.
      target_sent_bytes_per_second       = 0      # number | optional | Target bytes sent per second.
      target_sent_packets_per_second     = 0      # number | optional | Target packets sent per second.

    }

    request_utilization { # list [0..1]
      target_concurrent_requests      = 0      # number | optional | Target number of concurrent requests.
      target_request_count_per_second = ""     # string | optional | Target requests per second.

    }

  }

  deployment { # list [0..1]

    cloud_build_options { # list [0..1]
      app_yaml_path       = ""     # string | required | Path to the yaml file used in deployment, used to determine …
      cloud_build_timeout = ""     # string | optional | The Cloud Build timeout used as part of any dependent builds…

    }

    container { # list [0..1]
      image = ""     # string | required | URI to the hosted container image in Google Container Regist…

    }

    files { # set
      name       = ""     # string | required
      source_url = ""     # string | required | Source URL
      sha1_sum   = ""     # string | optional | SHA1 checksum of the file

    }

    zip { # list [0..1]
      source_url  = ""     # string | required | Source URL
      files_count = 0      # number | optional | files count

    }

  }

  endpoints_api_service { # list [0..1]
    name                   = ""     # string | required | Endpoints service name which is the name of the "service" re…
    config_id              = ""     # string | optional | Endpoints service configuration ID as specified by the Servi…
    disable_trace_sampling = false  # bool | optional | Enable or disable trace sampling. By default, this is set to…
    rollout_strategy       = ""     # string | optional | Endpoints rollout strategy. If FIXED, configId must be speci…

  }

  entrypoint { # list [0..1]
    shell = ""     # string | required | The format should be a shell command that can be fed to bash…

  }

  flexible_runtime_settings { # list [0..1]
    operating_system = ""     # string | optional | Operating System of the application runtime.
    runtime_version  = ""     # string | optional | The runtime version of an App Engine flexible application.

  }

  handlers { # list
    auth_fail_action            = ""     # string | optional | Actions to take when the user is not logged in. Possible val…
    login                       = ""     # string | optional | Methods to restrict access to a URL based on login status. P…
    redirect_http_response_code = ""     # string | optional | 30x code to use when performing redirects for the secure fie…
    security_level              = ""     # string | optional | Security (HTTPS) enforcement for this URL. Possible values: …
    url_regex                   = ""     # string | optional | URL prefix. Uses regular expression syntax, which means rege…

    script { # list [0..1]
      script_path = ""     # string | required | Path to the script from the application root directory.

    }

    static_files { # list [0..1]
      application_readable  = false  # bool | optional | Whether files should also be uploaded as code data. By defau…
      expiration            = ""     # string | optional | Time a static file served by this handler should be cached b…
      http_headers          = {}     # map(string) | optional | HTTP headers to use for all responses from these URLs. An ob…
      mime_type             = ""     # string | optional | MIME type used to serve all files served by this handler. De…
      path                  = ""     # string | optional | Path to the static files matched by the URL pattern, from th…
      require_matching_file = false  # bool | optional | Whether this handler should match the request if the file re…
      upload_path_regex     = ""     # string | optional | Regular expression that matches the file paths for all files…

    }

  }

  liveness_check { # list [1..1]
    path              = ""     # string | required | The request path.
    check_interval    = ""     # string | optional | Interval between health checks.
    failure_threshold = 0      # number | optional | Number of consecutive failed checks required before consider…
    host              = ""     # string | optional | Host header to send when performing a HTTP Readiness check. …
    initial_delay     = ""     # string | optional | The initial delay before starting to execute the checks. Def…
    success_threshold = 0      # number | optional | Number of consecutive successful checks required before cons…
    timeout           = ""     # string | optional | Time before the check is considered failed. Default: "4s"

  }

  manual_scaling { # list [0..1]
    instances = 0      # number | required | Number of instances to assign to the service at the start.  …

  }

  network { # list [0..1]
    name             = ""     # string | required | Google Compute Engine network where the virtual machines are…
    forwarded_ports  = []     # list(string) | optional | List of ports, or port pairs, to forward from the virtual ma…
    instance_tag     = ""     # string | optional | Tag to apply to the instance during creation.
    session_affinity = false  # bool | optional | Enable session affinity.
    subnetwork       = ""     # string | optional | Google Cloud Platform sub-network where the virtual machines…

  }

  readiness_check { # list [1..1]
    path              = ""     # string | required | The request path.
    app_start_timeout = ""     # string | optional | A maximum time limit on application initialization, measured…
    check_interval    = ""     # string | optional | Interval between health checks.  Default: "5s".
    failure_threshold = 0      # number | optional | Number of consecutive failed checks required before removing…
    host              = ""     # string | optional | Host header to send when performing a HTTP Readiness check. …
    success_threshold = 0      # number | optional | Number of consecutive successful checks required before rece…
    timeout           = ""     # string | optional | Time before the check is considered failed. Default: "4s"

  }

  resources { # list [0..1]
    cpu       = 0      # number | optional | Number of CPU cores needed.
    disk_gb   = 0      # number | optional | Disk size (GB) needed.
    memory_gb = 0      # number | optional | Memory (GB) needed.

    volumes { # list
      name        = ""     # string | required | Unique name for the volume.
      size_gb     = 0      # number | required | Volume size in gigabytes.
      volume_type = ""     # string | required | Underlying volume type, e.g. 'tmpfs'.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_access_connector { # list [0..1]
    name = ""     # string | required | Full Serverless VPC Access Connector name e.g. /projects/my-…

  }

}

