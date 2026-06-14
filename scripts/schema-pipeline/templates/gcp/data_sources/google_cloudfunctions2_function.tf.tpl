# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloudfunctions2_function                         │
# └──────────────────────────────────────────────────────────────┘
data "google_cloudfunctions2_function" "this" {

  location         = ""     # string | required | The location of this cloud function.
  name             = ""     # string | required | A user-defined name of the function. Function names must be …
  id               = ""     # string | optional+computed
  project          = ""     # string | optional

  # build_config = [  # list(object)
  #   {
  #     automatic_update_policy = [  # list(object)
  #       {
  #       }
  #     ]
  #     build = ""
  #     docker_repository = ""
  #     entry_point = ""
  #     environment_variables = {}  # map(string)
  #     on_deploy_update_policy = [  # list(object)
  #       {
  #         runtime_version = ""
  #       }
  #     ]
  #     runtime = ""
  #     service_account = ""
  #     source = [  # list(object)
  #       {
  #         repo_source = [  # list(object)
  #           {
  #             branch_name = ""
  #             commit_sha = ""
  #             dir = ""
  #             invert_regex = false
  #             project_id = ""
  #             repo_name = ""
  #             tag_name = ""
  #           }
  #         ]
  #         storage_source = [  # list(object)
  #           {
  #             bucket = ""
  #             generation = 0
  #             object = ""
  #           }
  #         ]
  #       }
  #     ]
  #     worker_pool = ""
  #   }
  # ]
  # description      = ""     # string | computed | User-provided description of a function.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # environment      = ""     # string | computed | The environment the function is hosted on.
  # event_trigger = [  # list(object)
  #   {
  #     event_filters = [  # set(object)
  #       {
  #         attribute = ""
  #         operator = ""
  #         value = ""
  #       }
  #     ]
  #     event_type = ""
  #     pubsub_topic = ""
  #     retry_policy = ""
  #     service_account_email = ""
  #     trigger = ""
  #     trigger_region = ""
  #   }
  # ]
  # kms_key_name     = ""     # string | computed | Resource name of a KMS crypto key (managed by the user) used…
  # labels           = {}     # map(string) | computed | A set of key/value label pairs associated with this Cloud Fu…
  # service_config = [  # list(object)
  #   {
  #     all_traffic_on_latest_revision = false
  #     available_cpu = ""
  #     available_memory = ""
  #     environment_variables = {}  # map(string)
  #     gcf_uri = ""
  #     ingress_settings = ""
  #     max_instance_count = 0
  #     max_instance_request_concurrency = 0
  #     min_instance_count = 0
  #     secret_environment_variables = [  # list(object)
  #       {
  #         key = ""
  #         project_id = ""
  #         secret = ""
  #         version = ""
  #       }
  #     ]
  #     secret_volumes = [  # list(object)
  #       {
  #         mount_path = ""
  #         project_id = ""
  #         secret = ""
  #         versions = [  # list(object)
  #           {
  #             path = ""
  #             version = ""
  #           }
  #         ]
  #       }
  #     ]
  #     service = ""
  #     service_account_email = ""
  #     timeout_seconds = 0
  #     uri = ""
  #     vpc_connector = ""
  #     vpc_connector_egress_settings = ""
  #   }
  # ]
  # state            = ""     # string | computed | Describes the current state of the function.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The last update timestamp of a Cloud Function.
  # url              = ""     # string | computed | Output only. The deployed url for the function.

}

