# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_feature_membership                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_feature_membership" "this" {

  feature             = ""     # string | required | The name of the feature
  location            = ""     # string | required | The location of the feature
  membership          = ""     # string | required | The name of the membership
  id                  = ""     # string | optional+computed
  membership_location = ""     # string | optional | The location of the membership
  project             = ""     # string | optional+computed | The project of the feature

  configmanagement { # list [0..1]
    management = ""     # string | optional+computed | Set this field to MANAGEMENT_AUTOMATIC to enable Config Sync…
    version    = ""     # string | optional+computed | Optional. Version of ACM to install. Defaults to the latest …

    binauthz { # list [0..1]
      enabled = false  # bool | optional | Whether binauthz is enabled in this cluster.

    }

    config_sync { # list [0..1]
      enabled                           = false  # bool | optional | Enables the installation of ConfigSync. If set to true, Conf…
      metrics_gcp_service_account_email = ""     # string | optional | The Email of the Google Cloud Service Account (GSA) used for…
      prevent_drift                     = false  # bool | optional+computed | Set to true to enable the Config Sync admission webhook to p…
      source_format                     = ""     # string | optional | Specifies whether the Config Sync Repo is in "hierarchical" …

      git { # list [0..1]
        gcp_service_account_email = ""     # string | optional | The GCP Service Account Email used for auth when secretType …
        https_proxy               = ""     # string | optional | URL for the HTTPS proxy to be used when communicating with t…
        policy_dir                = ""     # string | optional | The path within the Git repository that represents the top l…
        secret_type               = ""     # string | optional | Type of secret configured for access to the Git repo. Must b…
        sync_branch               = ""     # string | optional | The branch of the repository to sync from. Default: master.
        sync_repo                 = ""     # string | optional | The URL of the Git repository to use as the source of truth.
        sync_rev                  = ""     # string | optional | Git revision (tag or hash) to check out. Default HEAD.
        sync_wait_secs            = ""     # string | optional | Period in seconds between consecutive syncs. Default: 15.

      }

      oci { # list [0..1]
        gcp_service_account_email = ""     # string | optional | The GCP Service Account Email used for auth when secret_type…
        policy_dir                = ""     # string | optional | The absolute path of the directory that contains the local r…
        secret_type               = ""     # string | optional | Type of secret configured for access to the OCI Image. Must …
        sync_repo                 = ""     # string | optional | The OCI image repository URL for the package to sync from. e…
        sync_wait_secs            = ""     # string | optional | Period in seconds(int64 format) between consecutive syncs. D…

      }

    }

    hierarchy_controller { # list [0..1]
      enable_hierarchical_resource_quota = false  # bool | optional | Whether hierarchical resource quota is enabled in this clust…
      enable_pod_tree_labels             = false  # bool | optional | Whether pod tree labels are enabled in this cluster.
      enabled                            = false  # bool | optional | Whether Hierarchy Controller is enabled in this cluster.

    }

    policy_controller { # list [0..1]
      audit_interval_seconds     = ""     # string | optional | Sets the interval for Policy Controller Audit Scans (in seco…
      enabled                    = false  # bool | optional | Enables the installation of Policy Controller. If false, the…
      exemptable_namespaces      = []     # list(string) | optional | The set of namespaces that are excluded from Policy Controll…
      log_denies_enabled         = false  # bool | optional | Logs all denies and dry run failures.
      mutation_enabled           = false  # bool | optional | Enable or disable mutation in policy controller. If true, mu…
      referential_rules_enabled  = false  # bool | optional | Enables the ability to use Constraint Templates that referen…
      template_library_installed = false  # bool | optional | Installs the default template library along with Policy Cont…

      monitoring { # list [0..1]
        backends = []     # list(string) | optional+computed |  Specifies the list of backends Policy Controller will expor…

      }

    }

  }

  mesh { # list [0..1]
    control_plane = ""     # string | optional+DEPRECATED | **DEPRECATED** Whether to automatically manage Service Mesh …
    management    = ""     # string | optional | Whether to automatically manage Service Mesh. Possible value…

  }

  policycontroller { # list [0..1]
    version = ""     # string | optional+computed | Optional. Version of Policy Controller to install. Defaults …

    policy_controller_hub_config { # list [1..1]
      audit_interval_seconds     = 0      # number | optional | Sets the interval for Policy Controller Audit Scans (in seco…
      constraint_violation_limit = 0      # number | optional | The maximum number of audit violations to be stored in a con…
      exemptable_namespaces      = []     # list(string) | optional | The set of namespaces that are excluded from Policy Controll…
      install_spec               = ""     # string | optional | Configures the mode of the Policy Controller installation. P…
      log_denies_enabled         = false  # bool | optional | Logs all denies and dry run failures.
      mutation_enabled           = false  # bool | optional | Enables the ability to mutate resources using Policy Control…
      referential_rules_enabled  = false  # bool | optional | Enables the ability to use Constraint Templates that referen…

      deployment_configs { # set
        component_name = ""     # string | required | The name for the key in the map for which this object is map…
        pod_affinity   = ""     # string | optional | Pod affinity configuration. Possible values: AFFINITY_UNSPEC…
        replica_count  = 0      # number | optional | Pod replica count.

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

        pod_tolerations { # list
          effect   = ""     # string | optional | Matches a taint effect.
          key      = ""     # string | optional | Matches a taint key (not necessarily unique).
          operator = ""     # string | optional | Matches a taint operator.
          value    = ""     # string | optional | Matches a taint value.

        }

      }

      monitoring { # list [0..1]
        backends = []     # list(string) | optional+computed |  Specifies the list of backends Policy Controller will expor…

      }

      policy_content { # list [0..1]

        bundles { # set
          bundle_name         = ""     # string | required | The name for the key in the map for which this object is map…
          exempted_namespaces = []     # list(string) | optional | The set of namespaces to be exempted from the bundle.

        }

        template_library { # list [0..1]
          installation = ""     # string | optional | Configures the manner in which the template library is insta…

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

