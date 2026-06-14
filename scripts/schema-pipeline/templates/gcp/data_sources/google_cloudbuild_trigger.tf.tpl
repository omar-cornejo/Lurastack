# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloudbuild_trigger                               │
# └──────────────────────────────────────────────────────────────┘
data "google_cloudbuild_trigger" "this" {

  location                        = ""     # string | required | The [Cloud Build location](https://cloud.google.com/build/do…
  trigger_id                      = ""     # string | required | The unique identifier for the trigger.
  id                              = ""     # string | optional+computed
  project                         = ""     # string | optional

  # approval_config = [  # list(object)
  #   {
  #     approval_required = false
  #   }
  # ]
  # bitbucket_server_trigger_config = [  # list(object)
  #   {
  #     bitbucket_server_config_resource = ""
  #     project_key = ""
  #     pull_request = [  # list(object)
  #       {
  #         branch = ""
  #         comment_control = ""
  #         invert_regex = false
  #       }
  #     ]
  #     push = [  # list(object)
  #       {
  #         branch = ""
  #         invert_regex = false
  #         tag = ""
  #       }
  #     ]
  #     repo_slug = ""
  #   }
  # ]
  # build = [  # list(object)
  #   {
  #     artifacts = [  # list(object)
  #       {
  #         images = []  # list(string)
  #         maven_artifacts = [  # list(object)
  #           {
  #             artifact_id = ""
  #             group_id = ""
  #             path = ""
  #             repository = ""
  #             version = ""
  #           }
  #         ]
  #         npm_packages = [  # list(object)
  #           {
  #             package_path = ""
  #             repository = ""
  #           }
  #         ]
  #         objects = [  # list(object)
  #           {
  #             location = ""
  #             paths = []  # list(string)
  #             timing = [  # list(object)
  #               {
  #                 end_time = ""
  #                 start_time = ""
  #               }
  #             ]
  #           }
  #         ]
  #         python_packages = [  # list(object)
  #           {
  #             paths = []  # list(string)
  #             repository = ""
  #           }
  #         ]
  #       }
  #     ]
  #     available_secrets = [  # list(object)
  #       {
  #         secret_manager = [  # list(object)
  #           {
  #             env = ""
  #             version_name = ""
  #           }
  #         ]
  #       }
  #     ]
  #     images = []  # list(string)
  #     logs_bucket = ""
  #     options = [  # list(object)
  #       {
  #         disk_size_gb = 0
  #         dynamic_substitutions = false
  #         env = []  # list(string)
  #         log_streaming_option = ""
  #         logging = ""
  #         machine_type = ""
  #         requested_verify_option = ""
  #         secret_env = []  # list(string)
  #         source_provenance_hash = []  # list(string)
  #         substitution_option = ""
  #         volumes = [  # list(object)
  #           {
  #             name = ""
  #             path = ""
  #           }
  #         ]
  #         worker_pool = ""
  #       }
  #     ]
  #     queue_ttl = ""
  #     secret = [  # list(object)
  #       {
  #         kms_key_name = ""
  #         secret_env = {}  # map(string)
  #       }
  #     ]
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
  #             substitutions = {}  # map(string)
  #             tag_name = ""
  #           }
  #         ]
  #         storage_source = [  # list(object)
  #           {
  #             bucket = ""
  #             generation = ""
  #             object = ""
  #           }
  #         ]
  #       }
  #     ]
  #     step = [  # list(object)
  #       {
  #         allow_exit_codes = []  # list(number)
  #         allow_failure = false
  #         args = []  # list(string)
  #         dir = ""
  #         entrypoint = ""
  #         env = []  # list(string)
  #         id = ""
  #         name = ""
  #         script = ""
  #         secret_env = []  # list(string)
  #         timeout = ""
  #         timing = ""
  #         volumes = [  # list(object)
  #           {
  #             name = ""
  #             path = ""
  #           }
  #         ]
  #         wait_for = []  # list(string)
  #       }
  #     ]
  #     substitutions = {}  # map(string)
  #     tags = []  # list(string)
  #     timeout = ""
  #   }
  # ]
  # create_time                     = ""     # string | computed | Time when the trigger was created.
  # description                     = ""     # string | computed | Human-readable description of the trigger.
  # disabled                        = false  # bool | computed | Whether the trigger is disabled or not. If true, the trigger…
  # filename                        = ""     # string | computed | Path, from the source root, to a file whose contents is used…
  # filter                          = ""     # string | computed | A Common Expression Language string. Used only with Pub/Sub …
  # git_file_source = [  # list(object)
  #   {
  #     bitbucket_server_config = ""
  #     github_enterprise_config = ""
  #     path = ""
  #     repo_type = ""
  #     repository = ""
  #     revision = ""
  #     uri = ""
  #   }
  # ]
  # github = [  # list(object)
  #   {
  #     enterprise_config_resource_name = ""
  #     name = ""
  #     owner = ""
  #     pull_request = [  # list(object)
  #       {
  #         branch = ""
  #         comment_control = ""
  #         invert_regex = false
  #       }
  #     ]
  #     push = [  # list(object)
  #       {
  #         branch = ""
  #         invert_regex = false
  #         tag = ""
  #       }
  #     ]
  #   }
  # ]
  # ignored_files                   = []     # list(string) | computed | ignoredFiles and includedFiles are file glob matches using h…
  # include_build_logs              = ""     # string | computed | Build logs will be sent back to GitHub as part of the checkr…
  # included_files                  = []     # list(string) | computed | ignoredFiles and includedFiles are file glob matches using h…
  # name                            = ""     # string | computed | Name of the trigger. Must be unique within the project.
  # pubsub_config = [  # list(object)
  #   {
  #     service_account_email = ""
  #     state = ""
  #     subscription = ""
  #     topic = ""
  #   }
  # ]
  # repository_event_config = [  # list(object)
  #   {
  #     pull_request = [  # list(object)
  #       {
  #         branch = ""
  #         comment_control = ""
  #         invert_regex = false
  #       }
  #     ]
  #     push = [  # list(object)
  #       {
  #         branch = ""
  #         invert_regex = false
  #         tag = ""
  #       }
  #     ]
  #     repository = ""
  #   }
  # ]
  # service_account                 = ""     # string | computed | The service account used for all user-controlled operations …
  # source_to_build = [  # list(object)
  #   {
  #     bitbucket_server_config = ""
  #     github_enterprise_config = ""
  #     ref = ""
  #     repo_type = ""
  #     repository = ""
  #     uri = ""
  #   }
  # ]
  # substitutions                   = {}     # map(string) | computed | Substitutions data for Build resource.
  # tags                            = []     # list(string) | computed | Tags for annotation of a BuildTrigger
  # trigger_template = [  # list(object)
  #   {
  #     branch_name = ""
  #     commit_sha = ""
  #     dir = ""
  #     invert_regex = false
  #     project_id = ""
  #     repo_name = ""
  #     tag_name = ""
  #   }
  # ]
  # webhook_config = [  # list(object)
  #   {
  #     secret = ""
  #     state = ""
  #   }
  # ]

}

