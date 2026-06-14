# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_os_config_os_policy_assignment               │
# └──────────────────────────────────────────────────────────────┘
resource "google_os_config_os_policy_assignment" "this" {

  location             = ""     # string | required | The location for the resource
  name                 = ""     # string | required | Resource name.
  description          = ""     # string | optional | OS policy assignment description. Length of the description …
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional+computed | The project for the resource
  skip_await_rollout   = false  # bool | optional | Set to true to skip awaiting rollout during resource creatio…

  # baseline             = false  # bool | computed | Output only. Indicates that this revision has been successfu…
  # deleted              = false  # bool | computed | Output only. Indicates that this revision deletes the OS pol…
  # etag                 = ""     # string | computed | The etag for this OS policy assignment. If this is provided …
  # reconciling          = false  # bool | computed | Output only. Indicates that reconciliation is in progress fo…
  # revision_create_time = ""     # string | computed | Output only. The timestamp that the revision was created.
  # revision_id          = ""     # string | computed | Output only. The assignment revision ID A new revision is co…
  # rollout_state        = ""     # string | computed | Output only. OS policy assignment rollout state
  # uid                  = ""     # string | computed | Output only. Server generated unique id for the OS policy as…

  instance_filter { # list [1..1]
    all = false  # bool | optional | Target all VMs in the project. If true, no other criteria is…

    exclusion_labels { # list
      labels = {}     # map(string) | optional | Labels are identified by key/value pairs in this map. A VM s…

    }

    inclusion_labels { # list
      labels = {}     # map(string) | optional | Labels are identified by key/value pairs in this map. A VM s…

    }

    inventories { # list
      os_short_name = ""     # string | required | The OS short name
      os_version    = ""     # string | optional | The OS version Prefix matches are supported if asterisk(*) i…

    }

  }

  os_policies { # list [1..*]
    id                            = ""     # string | required | The id of the OS policy with the following restrictions: * M…
    mode                          = ""     # string | required | Policy mode Possible values: ["MODE_UNSPECIFIED", "VALIDATIO…
    allow_no_resource_group_match = false  # bool | optional | This flag determines the OS policy compliance status when no…
    description                   = ""     # string | optional | Policy description. Length of the description is limited to …

    resource_groups { # list [1..*]

      inventory_filters { # list
        os_short_name = ""     # string | required | The OS short name
        os_version    = ""     # string | optional | The OS version Prefix matches are supported if asterisk(*) i…

      }

      resources { # list [1..*]
        id = ""     # string | required | The id of the resource with the following restrictions: * Mu…

        exec { # list [0..1]

          enforce { # list [0..1]
            interpreter      = ""     # string | required | The script interpreter to use. Possible values: ["INTERPRETE…
            args             = []     # list(string) | optional | Optional arguments to pass to the source during execution.
            output_file_path = ""     # string | optional | Only recorded for enforce Exec. Path to an output file (that…
            script           = ""     # string | optional | An inline script. The size of the script is limited to 1024 …

            file { # list [0..1]
              allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
              local_path     = ""     # string | optional | A local path within the VM to use.

              gcs { # list [0..1]
                bucket     = ""     # string | required | Bucket of the Cloud Storage object.
                object     = ""     # string | required | Name of the Cloud Storage object.
                generation = 0      # number | optional | Generation number of the Cloud Storage object.

              }

              remote { # list [0..1]
                uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
                sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

              }

            }

          }

          validate { # list [1..1]
            interpreter      = ""     # string | required | The script interpreter to use. Possible values: ["INTERPRETE…
            args             = []     # list(string) | optional | Optional arguments to pass to the source during execution.
            output_file_path = ""     # string | optional | Only recorded for enforce Exec. Path to an output file (that…
            script           = ""     # string | optional | An inline script. The size of the script is limited to 1024 …

            file { # list [0..1]
              allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
              local_path     = ""     # string | optional | A local path within the VM to use.

              gcs { # list [0..1]
                bucket     = ""     # string | required | Bucket of the Cloud Storage object.
                object     = ""     # string | required | Name of the Cloud Storage object.
                generation = 0      # number | optional | Generation number of the Cloud Storage object.

              }

              remote { # list [0..1]
                uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
                sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

              }

            }

          }

        }

        file { # list [0..1]
          path        = ""     # string | required | The absolute path of the file within the VM.
          state       = ""     # string | required | Desired state of the file. Possible values: ["DESIRED_STATE_…
          content     = ""     # string | optional | A a file with this content. The size of the content is limit…

          # permissions = ""     # string | computed | Consists of three octal digits which represent, in order, th…

          file { # list [0..1]
            allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
            local_path     = ""     # string | optional | A local path within the VM to use.

            gcs { # list [0..1]
              bucket     = ""     # string | required | Bucket of the Cloud Storage object.
              object     = ""     # string | required | Name of the Cloud Storage object.
              generation = 0      # number | optional | Generation number of the Cloud Storage object.

            }

            remote { # list [0..1]
              uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
              sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

            }

          }

        }

        pkg { # list [0..1]
          desired_state = ""     # string | required | The desired state the agent should maintain for this package…

          apt { # list [0..1]
            name = ""     # string | required | Package name.

          }

          deb { # list [0..1]
            pull_deps = false  # bool | optional | Whether dependencies should also be installed. - install whe…

            source { # list [1..1]
              allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
              local_path     = ""     # string | optional | A local path within the VM to use.

              gcs { # list [0..1]
                bucket     = ""     # string | required | Bucket of the Cloud Storage object.
                object     = ""     # string | required | Name of the Cloud Storage object.
                generation = 0      # number | optional | Generation number of the Cloud Storage object.

              }

              remote { # list [0..1]
                uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
                sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

              }

            }

          }

          googet { # list [0..1]
            name = ""     # string | required | Package name.

          }

          msi { # list [0..1]
            properties = []     # list(string) | optional | Additional properties to use during installation. This shoul…

            source { # list [1..1]
              allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
              local_path     = ""     # string | optional | A local path within the VM to use.

              gcs { # list [0..1]
                bucket     = ""     # string | required | Bucket of the Cloud Storage object.
                object     = ""     # string | required | Name of the Cloud Storage object.
                generation = 0      # number | optional | Generation number of the Cloud Storage object.

              }

              remote { # list [0..1]
                uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
                sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

              }

            }

          }

          rpm { # list [0..1]
            pull_deps = false  # bool | optional | Whether dependencies should also be installed. - install whe…

            source { # list [1..1]
              allow_insecure = false  # bool | optional | Defaults to false. When false, files are subject to validati…
              local_path     = ""     # string | optional | A local path within the VM to use.

              gcs { # list [0..1]
                bucket     = ""     # string | required | Bucket of the Cloud Storage object.
                object     = ""     # string | required | Name of the Cloud Storage object.
                generation = 0      # number | optional | Generation number of the Cloud Storage object.

              }

              remote { # list [0..1]
                uri             = ""     # string | required | URI from which to fetch the object. It should contain both t…
                sha256_checksum = ""     # string | optional | SHA256 checksum of the remote file.

              }

            }

          }

          yum { # list [0..1]
            name = ""     # string | required | Package name.

          }

          zypper { # list [0..1]
            name = ""     # string | required | Package name.

          }

        }

        repository { # list [0..1]

          apt { # list [0..1]
            archive_type = ""     # string | required | Type of archive files in this repository. Possible values: […
            components   = []     # list(string) | required | List of components for this repository. Must contain at leas…
            distribution = ""     # string | required | Distribution of this repository.
            uri          = ""     # string | required | URI for this repository.
            gpg_key      = ""     # string | optional | URI of the key file for this repository. The agent maintains…

          }

          goo { # list [0..1]
            name = ""     # string | required | The name of the repository.
            url  = ""     # string | required | The url of the repository.

          }

          yum { # list [0..1]
            base_url     = ""     # string | required | The location of the repository directory.
            id           = ""     # string | required | A one word, unique name for this repository. This is the 're…
            display_name = ""     # string | optional | The display name of the repository.
            gpg_keys     = []     # list(string) | optional | URIs of GPG keys.

          }

          zypper { # list [0..1]
            base_url     = ""     # string | required | The location of the repository directory.
            id           = ""     # string | required | A one word, unique name for this repository. This is the 're…
            display_name = ""     # string | optional | The display name of the repository.
            gpg_keys     = []     # list(string) | optional | URIs of GPG keys.

          }

        }

      }

    }

  }

  rollout { # list [1..1]
    min_wait_duration = ""     # string | required | This determines the minimum duration of time to wait after t…

    disruption_budget { # list [1..1]
      fixed   = 0      # number | optional | Specifies a fixed value.
      percent = 0      # number | optional | Specifies the relative value defined as a percentage, which …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

