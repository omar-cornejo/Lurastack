# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_run_service                                │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_run_service" "this" {

  location                   = ""     # string | required | The location of the cloud run instance. eg us-central1
  name                       = ""     # string | required | Name must be unique within a Google Cloud project and region…
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional

  # autogenerate_revision_name = false  # bool | computed | If set to 'true', the revision name (template.metadata.name)…
  # metadata = [  # list(object)
  #   {
  #     annotations = {}  # map(string)
  #     effective_annotations = {}  # map(string)
  #     effective_labels = {}  # map(string)
  #     generation = 0
  #     labels = {}  # map(string)
  #     namespace = ""
  #     resource_version = ""
  #     self_link = ""
  #     terraform_labels = {}  # map(string)
  #     uid = ""
  #   }
  # ]
  # status = [  # list(object)
  #   {
  #     conditions = [  # list(object)
  #       {
  #         message = ""
  #         reason = ""
  #         status = ""
  #         type = ""
  #       }
  #     ]
  #     latest_created_revision_name = ""
  #     latest_ready_revision_name = ""
  #     observed_generation = 0
  #     traffic = [  # list(object)
  #       {
  #         latest_revision = false
  #         percent = 0
  #         revision_name = ""
  #         tag = ""
  #         url = ""
  #       }
  #     ]
  #     url = ""
  #   }
  # ]
  # template = [  # list(object)
  #   {
  #     metadata = [  # list(object)
  #       {
  #         annotations = {}  # map(string)
  #         generation = 0
  #         labels = {}  # map(string)
  #         name = ""
  #         namespace = ""
  #         resource_version = ""
  #         self_link = ""
  #         uid = ""
  #       }
  #     ]
  #     spec = [  # list(object)
  #       {
  #         container_concurrency = 0
  #         containers = [  # list(object)
  #           {
  #             args = []  # list(string)
  #             command = []  # list(string)
  #             env = [  # set(object)
  #               {
  #                 name = ""
  #                 value = ""
  #                 value_from = [  # list(object)
  #                   {
  #                     secret_key_ref = [  # list(object)
  #                       {
  #                         key = ""
  #                         name = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #               }
  #             ]
  #             env_from = [  # list(object)
  #               {
  #                 config_map_ref = [  # list(object)
  #                   {
  #                     local_object_reference = [  # list(object)
  #                       {
  #                         name = ""
  #                       }
  #                     ]
  #                     optional = false
  #                   }
  #                 ]
  #                 prefix = ""
  #                 secret_ref = [  # list(object)
  #                   {
  #                     local_object_reference = [  # list(object)
  #                       {
  #                         name = ""
  #                       }
  #                     ]
  #                     optional = false
  #                   }
  #                 ]
  #               }
  #             ]
  #             image = ""
  #             liveness_probe = [  # list(object)
  #               {
  #                 failure_threshold = 0
  #                 grpc = [  # list(object)
  #                   {
  #                     port = 0
  #                     service = ""
  #                   }
  #                 ]
  #                 http_get = [  # list(object)
  #                   {
  #                     http_headers = [  # list(object)
  #                       {
  #                         name = ""
  #                         value = ""
  #                       }
  #                     ]
  #                     path = ""
  #                     port = 0
  #                   }
  #                 ]
  #                 initial_delay_seconds = 0
  #                 period_seconds = 0
  #                 timeout_seconds = 0
  #               }
  #             ]
  #             name = ""
  #             ports = [  # list(object)
  #               {
  #                 container_port = 0
  #                 name = ""
  #                 protocol = ""
  #               }
  #             ]
  #             resources = [  # list(object)
  #               {
  #                 limits = {}  # map(string)
  #                 requests = {}  # map(string)
  #               }
  #             ]
  #             startup_probe = [  # list(object)
  #               {
  #                 failure_threshold = 0
  #                 grpc = [  # list(object)
  #                   {
  #                     port = 0
  #                     service = ""
  #                   }
  #                 ]
  #                 http_get = [  # list(object)
  #                   {
  #                     http_headers = [  # list(object)
  #                       {
  #                         name = ""
  #                         value = ""
  #                       }
  #                     ]
  #                     path = ""
  #                     port = 0
  #                   }
  #                 ]
  #                 initial_delay_seconds = 0
  #                 period_seconds = 0
  #                 tcp_socket = [  # list(object)
  #                   {
  #                     port = 0
  #                   }
  #                 ]
  #                 timeout_seconds = 0
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
  #         service_account_name = ""
  #         serving_state = ""
  #         timeout_seconds = 0
  #         volumes = [  # list(object)
  #           {
  #             name = ""
  #             secret = [  # list(object)
  #               {
  #                 default_mode = 0
  #                 items = [  # list(object)
  #                   {
  #                     key = ""
  #                     mode = 0
  #                     path = ""
  #                   }
  #                 ]
  #                 secret_name = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # traffic = [  # list(object)
  #   {
  #     latest_revision = false
  #     percent = 0
  #     revision_name = ""
  #     tag = ""
  #     url = ""
  #   }
  # ]

}

