# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_run_v2_job                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_run_v2_job" "this" {

  name                     = ""     # string | required | Name of the Job.
  id                       = ""     # string | optional+computed
  location                 = ""     # string | optional | The location of the cloud run job
  project                  = ""     # string | optional

  # annotations              = {}     # map(string) | computed | Unstructured key value map that may be set by external tools…
  # binary_authorization = [  # list(object)
  #   {
  #     breakglass_justification = ""
  #     policy = ""
  #     use_default = false
  #   }
  # ]
  # client                   = ""     # string | computed | Arbitrary identifier for the API client.
  # client_version           = ""     # string | computed | Arbitrary version identifier for the API client.
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
  # labels                   = {}     # map(string) | computed | Unstructured key value map that can be used to organize and …
  # last_modifier            = ""     # string | computed | Email address of the last authenticated modifier.
  # latest_created_execution = [  # list(object)
  #   {
  #     completion_time = ""
  #     create_time = ""
  #     name = ""
  #   }
  # ]
  # launch_stage             = ""     # string | computed | The launch stage as defined by [Google Cloud Platform Launch…
  # observed_generation      = ""     # string | computed | The generation of this Job. See comments in reconciling for …
  # reconciling              = false  # bool | computed | Returns true if the Job is currently being acted upon by the…
  # template = [  # list(object)
  #   {
  #     annotations = {}  # map(string)
  #     labels = {}  # map(string)
  #     parallelism = 0
  #     task_count = 0
  #     template = [  # list(object)
  #       {
  #         containers = [  # list(object)
  #           {
  #             args = []  # list(string)
  #             command = []  # list(string)
  #             env = [  # list(object)
  #               {
  #                 name = ""
  #                 value = ""
  #                 value_source = [  # list(object)
  #                   {
  #                     secret_key_ref = [  # list(object)
  #                       {
  #                         secret = ""
  #                         version = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #               }
  #             ]
  #             image = ""
  #             name = ""
  #             ports = [  # list(object)
  #               {
  #                 container_port = 0
  #                 name = ""
  #               }
  #             ]
  #             resources = [  # list(object)
  #               {
  #                 limits = {}  # map(string)
  #               }
  #             ]
  #             volume_mounts = [  # list(object)
  #               {
  #                 mount_path = ""
  #                 name = ""
  #               }
  #             ]
  #             working_dir = ""
  #           }
  #         ]
  #         encryption_key = ""
  #         execution_environment = ""
  #         max_retries = 0
  #         service_account = ""
  #         timeout = ""
  #         volumes = [  # list(object)
  #           {
  #             cloud_sql_instance = [  # list(object)
  #               {
  #                 instances = []  # list(string)
  #               }
  #             ]
  #             name = ""
  #             secret = [  # list(object)
  #               {
  #                 default_mode = 0
  #                 items = [  # list(object)
  #                   {
  #                     mode = 0
  #                     path = ""
  #                     version = ""
  #                   }
  #                 ]
  #                 secret = ""
  #               }
  #             ]
  #           }
  #         ]
  #         vpc_access = [  # list(object)
  #           {
  #             connector = ""
  #             egress = ""
  #             network_interfaces = [  # list(object)
  #               {
  #                 network = ""
  #                 subnetwork = ""
  #                 tags = []  # list(string)
  #               }
  #             ]
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
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                      = ""     # string | computed | Server assigned unique identifier for the Execution. The val…
  # update_time              = ""     # string | computed | The last-modified time.

}

