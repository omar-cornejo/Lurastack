# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_run_v2_service                             │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_run_v2_service" "this" {

  name                    = ""     # string | required | Name of the Service.
  id                      = ""     # string | optional+computed
  location                = ""     # string | optional | The location of the cloud run service
  project                 = ""     # string | optional

  # annotations             = {}     # map(string) | computed | Unstructured key value map that may be set by external tools…
  # binary_authorization = [  # list(object)
  #   {
  #     breakglass_justification = ""
  #     policy = ""
  #     use_default = false
  #   }
  # ]
  # client                  = ""     # string | computed | Arbitrary identifier for the API client.
  # client_version          = ""     # string | computed | Arbitrary version identifier for the API client.
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
  # custom_audiences        = []     # list(string) | computed | One or more custom audiences that you want this service to s…
  # delete_time             = ""     # string | computed | The deletion time.
  # description             = ""     # string | computed | User-provided description of the Service. This field current…
  # effective_annotations   = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels        = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                    = ""     # string | computed | A system-generated fingerprint for this version of the resou…
  # expire_time             = ""     # string | computed | For a deleted resource, the time after which it will be perm…
  # generation              = ""     # string | computed | A number that monotonically increases every time the user mo…
  # ingress                 = ""     # string | computed | Provides the ingress settings for this Service. On output, r…
  # labels                  = {}     # map(string) | computed | Unstructured key value map that can be used to organize and …
  # last_modifier           = ""     # string | computed | Email address of the last authenticated modifier.
  # latest_created_revision = ""     # string | computed | Name of the last created revision. See comments in reconcili…
  # latest_ready_revision   = ""     # string | computed | Name of the latest revision that is serving traffic. See com…
  # launch_stage            = ""     # string | computed | The launch stage as defined by [Google Cloud Platform Launch…
  # observed_generation     = ""     # string | computed | The generation of this Service currently serving traffic. Se…
  # reconciling             = false  # bool | computed | Returns true if the Service is currently being acted upon by…
  # template = [  # list(object)
  #   {
  #     annotations = {}  # map(string)
  #     containers = [  # list(object)
  #       {
  #         args = []  # list(string)
  #         command = []  # list(string)
  #         depends_on = []  # list(string)
  #         env = [  # list(object)
  #           {
  #             name = ""
  #             value = ""
  #             value_source = [  # list(object)
  #               {
  #                 secret_key_ref = [  # list(object)
  #                   {
  #                     secret = ""
  #                     version = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #           }
  #         ]
  #         image = ""
  #         liveness_probe = [  # list(object)
  #           {
  #             failure_threshold = 0
  #             grpc = [  # list(object)
  #               {
  #                 port = 0
  #                 service = ""
  #               }
  #             ]
  #             http_get = [  # list(object)
  #               {
  #                 http_headers = [  # list(object)
  #                   {
  #                     name = ""
  #                     value = ""
  #                   }
  #                 ]
  #                 path = ""
  #                 port = 0
  #               }
  #             ]
  #             initial_delay_seconds = 0
  #             period_seconds = 0
  #             tcp_socket = [  # list(object)
  #               {
  #                 port = 0
  #               }
  #             ]
  #             timeout_seconds = 0
  #           }
  #         ]
  #         name = ""
  #         ports = [  # list(object)
  #           {
  #             container_port = 0
  #             name = ""
  #           }
  #         ]
  #         resources = [  # list(object)
  #           {
  #             cpu_idle = false
  #             limits = {}  # map(string)
  #             startup_cpu_boost = false
  #           }
  #         ]
  #         startup_probe = [  # list(object)
  #           {
  #             failure_threshold = 0
  #             grpc = [  # list(object)
  #               {
  #                 port = 0
  #                 service = ""
  #               }
  #             ]
  #             http_get = [  # list(object)
  #               {
  #                 http_headers = [  # list(object)
  #                   {
  #                     name = ""
  #                     value = ""
  #                   }
  #                 ]
  #                 path = ""
  #                 port = 0
  #               }
  #             ]
  #             initial_delay_seconds = 0
  #             period_seconds = 0
  #             tcp_socket = [  # list(object)
  #               {
  #                 port = 0
  #               }
  #             ]
  #             timeout_seconds = 0
  #           }
  #         ]
  #         volume_mounts = [  # list(object)
  #           {
  #             mount_path = ""
  #             name = ""
  #           }
  #         ]
  #         working_dir = ""
  #       }
  #     ]
  #     encryption_key = ""
  #     execution_environment = ""
  #     labels = {}  # map(string)
  #     max_instance_request_concurrency = 0
  #     revision = ""
  #     scaling = [  # list(object)
  #       {
  #         max_instance_count = 0
  #         min_instance_count = 0
  #       }
  #     ]
  #     service_account = ""
  #     session_affinity = false
  #     timeout = ""
  #     volumes = [  # list(object)
  #       {
  #         cloud_sql_instance = [  # list(object)
  #           {
  #             instances = []  # set(string)
  #           }
  #         ]
  #         gcs = [  # list(object)
  #           {
  #             bucket = ""
  #             read_only = false
  #           }
  #         ]
  #         name = ""
  #         nfs = [  # list(object)
  #           {
  #             path = ""
  #             read_only = false
  #             server = ""
  #           }
  #         ]
  #         secret = [  # list(object)
  #           {
  #             default_mode = 0
  #             items = [  # list(object)
  #               {
  #                 mode = 0
  #                 path = ""
  #                 version = ""
  #               }
  #             ]
  #             secret = ""
  #           }
  #         ]
  #       }
  #     ]
  #     vpc_access = [  # list(object)
  #       {
  #         connector = ""
  #         egress = ""
  #         network_interfaces = [  # list(object)
  #           {
  #             network = ""
  #             subnetwork = ""
  #             tags = []  # list(string)
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
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
  # traffic = [  # list(object)
  #   {
  #     percent = 0
  #     revision = ""
  #     tag = ""
  #     type = ""
  #   }
  # ]
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

}

