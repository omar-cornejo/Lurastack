# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_feature                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_feature" "this" {

  location         = ""     # string | required | The location for the resource
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | GCP labels for this Feature.  **Note**: This field is non-au…
  name             = ""     # string | optional | The full, unique name of this Feature resource
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Output only. When the Feature resource was created.
  # delete_time      = ""     # string | computed | Output only. When the Feature resource was deleted.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # resource_state = [  # list(object)
  #   {
  #     has_resources = false
  #     state = ""
  #   }
  # ]
  # state = [  # list(object)
  #   {
  #     state = [  # list(object)
  #       {
  #         code = ""
  #         description = ""
  #         update_time = ""
  #       }
  #     ]
  #   }
  # ]
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Output only. When the Feature resource was last updated.

  fleet_default_member_config { # list [0..1]

    configmanagement { # list [0..1]
      management = ""     # string | optional | Set this field to MANAGEMENT_AUTOMATIC to enable Config Sync…
      version    = ""     # string | optional | Version of ACM installed

      config_sync { # list [0..1]
        enabled       = false  # bool | optional | Enables the installation of ConfigSync. If set to true, Conf…
        prevent_drift = false  # bool | optional | Set to true to enable the Config Sync admission webhook to p…
        source_format = ""     # string | optional | Specifies whether the Config Sync Repo is in hierarchical or…

        git { # list [0..1]
          secret_type               = ""     # string | required | Type of secret configured for access to the Git repo
          gcp_service_account_email = ""     # string | optional | The Google Cloud Service Account Email used for auth when se…
          https_proxy               = ""     # string | optional | URL for the HTTPS Proxy to be used when communicating with t…
          policy_dir                = ""     # string | optional | The path within the Git repository that represents the top l…
          sync_branch               = ""     # string | optional | The branch of the repository to sync from. Default: master
          sync_repo                 = ""     # string | optional | The URL of the Git repository to use as the source of truth
          sync_rev                  = ""     # string | optional | Git revision (tag or hash) to check out. Default HEAD
          sync_wait_secs            = ""     # string | optional | Period in seconds between consecutive syncs. Default: 15

        }

        oci { # list [0..1]
          secret_type               = ""     # string | required | Type of secret configured for access to the Git repo
          gcp_service_account_email = ""     # string | optional | The Google Cloud Service Account Email used for auth when se…
          policy_dir                = ""     # string | optional | The absolute path of the directory that contains the local r…
          sync_repo                 = ""     # string | optional | The OCI image repository URL for the package to sync from
          sync_wait_secs            = ""     # string | optional | Period in seconds between consecutive syncs. Default: 15
          version                   = ""     # string | optional+DEPRECATED | Version of ACM installed

        }

      }

    }

    mesh { # list [0..1]
      management = ""     # string | required | Whether to automatically manage Service Mesh Possible values…

    }

    policycontroller { # list [0..1]
      version = ""     # string | optional+computed | Configures the version of Policy Controller

      policy_controller_hub_config { # list [1..1]
        install_spec               = ""     # string | required | Configures the mode of the Policy Controller installation Po…
        audit_interval_seconds     = 0      # number | optional | Interval for Policy Controller Audit scans (in seconds). Whe…
        constraint_violation_limit = 0      # number | optional | The maximum number of audit violations to be stored in a con…
        exemptable_namespaces      = []     # list(string) | optional | The set of namespaces that are excluded from Policy Controll…
        log_denies_enabled         = false  # bool | optional | Logs all denies and dry run failures.
        mutation_enabled           = false  # bool | optional | Enables the ability to mutate resources using Policy Control…
        referential_rules_enabled  = false  # bool | optional | Enables the ability to use Constraint Templates that referen…

        deployment_configs { # set
          component     = ""     # string | required
          pod_affinity  = ""     # string | optional+computed | Pod affinity configuration. Possible values: ["AFFINITY_UNSP…
          replica_count = 0      # number | optional+computed | Pod replica count.

          container_resources { # list [0..1]

            limits { # list [0..1]
              cpu    = ""     # string | optional | CPU requirement expressed in Kubernetes resource units.
              memory = ""     # string | optional | Memory requirement expressed in Kubernetes resource units.

            }

            requests { # list [0..1]
              cpu    = ""     # string | optional | CPU requirement expressed in Kubernetes resource units.
              memory = ""     # string | optional | Memory requirement expressed in Kubernetes resource units.

            }

          }

          pod_toleration { # list
            effect   = ""     # string | optional | Matches a taint effect.
            key      = ""     # string | optional | Matches a taint key (not necessarily unique).
            operator = ""     # string | optional | Matches a taint operator.
            value    = ""     # string | optional | Matches a taint value.

          }

        }

        monitoring { # list [0..1]
          backends = []     # list(string) | optional+computed | Specifies the list of backends Policy Controller will export…

        }

        policy_content { # list [0..1]

          bundles { # set
            bundle              = ""     # string | required
            exempted_namespaces = []     # list(string) | optional | The set of namespaces to be exempted from the bundle.

          }

          template_library { # list [0..1]
            installation = ""     # string | optional | Configures the manner in which the template library is insta…

          }

        }

      }

    }

  }

  spec { # list [0..1]

    clusterupgrade { # list [0..1]
      upstream_fleets = []     # list(string) | required | Specified if other fleet should be considered as a source of…

      gke_upgrade_overrides { # list

        post_conditions { # list [1..1]
          soaking = ""     # string | required | Amount of time to "soak" after a rollout has been finished b…

        }

        upgrade { # list [1..1]
          name    = ""     # string | required | Name of the upgrade, e.g., "k8s_control_plane". It should be…
          version = ""     # string | required | Version of the upgrade, e.g., "1.22.1-gke.100". It should be…

        }

      }

      post_conditions { # list [0..1]
        soaking = ""     # string | required | Amount of time to "soak" after a rollout has been finished b…

      }

    }

    fleetobservability { # list [0..1]

      logging_config { # list [0..1]

        default_config { # list [0..1]
          mode = ""     # string | optional | Specified if fleet logging feature is enabled. Possible valu…

        }

        fleet_scope_logs_config { # list [0..1]
          mode = ""     # string | optional | Specified if fleet logging feature is enabled. Possible valu…

        }

      }

    }

    multiclusteringress { # list [0..1]
      config_membership = ""     # string | required | Fully-qualified Membership name which hosts the MultiCluster…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

