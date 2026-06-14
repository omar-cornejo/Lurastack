# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_artifact_registry_repository                     │
# └──────────────────────────────────────────────────────────────┘
data "google_artifact_registry_repository" "this" {

  location                  = ""     # string | required | The name of the location this repository is located in.
  repository_id             = ""     # string | required | The last part of the repository name, for example: "repo1"
  id                        = ""     # string | optional+computed
  project                   = ""     # string | optional

  # cleanup_policies = [  # set(object)
  #   {
  #     action = ""
  #     condition = [  # list(object)
  #       {
  #         newer_than = ""
  #         older_than = ""
  #         package_name_prefixes = []  # list(string)
  #         tag_prefixes = []  # list(string)
  #         tag_state = ""
  #         version_name_prefixes = []  # list(string)
  #       }
  #     ]
  #     id = ""
  #     most_recent_versions = [  # list(object)
  #       {
  #         keep_count = 0
  #         package_name_prefixes = []  # list(string)
  #       }
  #     ]
  #   }
  # ]
  # cleanup_policy_dry_run    = false  # bool | computed | If true, the cleanup pipeline is prevented from deleting ver…
  # create_time               = ""     # string | computed | The time when the repository was created.
  # description               = ""     # string | computed | The user-provided description of the repository.
  # docker_config = [  # list(object)
  #   {
  #     immutable_tags = false
  #   }
  # ]
  # effective_labels          = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # format                    = ""     # string | computed | The format of packages that are stored in the repository. Su…
  # kms_key_name              = ""     # string | computed | The Cloud KMS resource name of the customer managed encrypti…
  # labels                    = {}     # map(string) | computed | Labels with user-defined metadata. This field may contain up…
  # maven_config = [  # list(object)
  #   {
  #     allow_snapshot_overwrites = false
  #     version_policy = ""
  #   }
  # ]
  # mode                      = ""     # string | computed | The mode configures the repository to serve artifacts from d…
  # name                      = ""     # string | computed | The name of the repository, for example: "repo1"
  # remote_repository_config = [  # list(object)
  #   {
  #     apt_repository = [  # list(object)
  #       {
  #         public_repository = [  # list(object)
  #           {
  #             repository_base = ""
  #             repository_path = ""
  #           }
  #         ]
  #       }
  #     ]
  #     description = ""
  #     disable_upstream_validation = false
  #     docker_repository = [  # list(object)
  #       {
  #         custom_repository = [  # list(object)
  #           {
  #             uri = ""
  #           }
  #         ]
  #         public_repository = ""
  #       }
  #     ]
  #     maven_repository = [  # list(object)
  #       {
  #         custom_repository = [  # list(object)
  #           {
  #             uri = ""
  #           }
  #         ]
  #         public_repository = ""
  #       }
  #     ]
  #     npm_repository = [  # list(object)
  #       {
  #         custom_repository = [  # list(object)
  #           {
  #             uri = ""
  #           }
  #         ]
  #         public_repository = ""
  #       }
  #     ]
  #     python_repository = [  # list(object)
  #       {
  #         custom_repository = [  # list(object)
  #           {
  #             uri = ""
  #           }
  #         ]
  #         public_repository = ""
  #       }
  #     ]
  #     upstream_credentials = [  # list(object)
  #       {
  #         username_password_credentials = [  # list(object)
  #           {
  #             password_secret_version = ""
  #             username = ""
  #           }
  #         ]
  #       }
  #     ]
  #     yum_repository = [  # list(object)
  #       {
  #         public_repository = [  # list(object)
  #           {
  #             repository_base = ""
  #             repository_path = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # terraform_labels          = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time               = ""     # string | computed | The time when the repository was last updated.
  # virtual_repository_config = [  # list(object)
  #   {
  #     upstream_policies = [  # list(object)
  #       {
  #         id = ""
  #         priority = 0
  #         repository = ""
  #       }
  #     ]
  #   }
  # ]

}

