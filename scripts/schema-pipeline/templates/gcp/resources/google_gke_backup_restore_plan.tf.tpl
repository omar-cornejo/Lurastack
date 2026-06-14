# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_backup_restore_plan                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_backup_restore_plan" "this" {

  backup_plan      = ""     # string | required | A reference to the BackupPlan from which Backups may be used…
  cluster          = ""     # string | required | The source cluster from which Restores will be created via t…
  location         = ""     # string | required | The region of the Restore Plan.
  name             = ""     # string | required | The full name of the BackupPlan Resource.
  description      = ""     # string | optional | User specified descriptive string for this RestorePlan.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Description: A set of custom labels supplied by the user. A …
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # state            = ""     # string | computed | The State of the RestorePlan.
  # state_reason     = ""     # string | computed | Detailed description of why RestorePlan is in its current st…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | Server generated, unique identifier of UUID format.

  restore_config { # list [1..1]
    all_namespaces                   = false  # bool | optional | If True, restore all namespaced resources in the Backup. Set…
    cluster_resource_conflict_policy = ""     # string | optional | Defines the behavior for handling the situation where cluste…
    namespaced_resource_restore_mode = ""     # string | optional | Defines the behavior for handling the situation where sets o…
    no_namespaces                    = false  # bool | optional | Do not restore any namespaced resources if set to "True". Sp…
    volume_data_restore_policy       = ""     # string | optional | Specifies the mechanism to be used to restore volume data. T…

    cluster_resource_restore_scope { # list [0..1]
      all_group_kinds = false  # bool | optional | If True, all valid cluster-scoped resources will be restored…
      no_group_kinds  = false  # bool | optional | If True, no cluster-scoped resources will be restored. Mutua…

      excluded_group_kinds { # list
        resource_group = ""     # string | optional | API Group string of a Kubernetes resource, e.g. "apiextensio…
        resource_kind  = ""     # string | optional | Kind of a Kubernetes resource, e.g. "CustomResourceDefinitio…

      }

      selected_group_kinds { # list
        resource_group = ""     # string | optional | API Group string of a Kubernetes resource, e.g. "apiextensio…
        resource_kind  = ""     # string | optional | Kind of a Kubernetes resource, e.g. "CustomResourceDefinitio…

      }

    }

    excluded_namespaces { # list [0..1]
      namespaces = []     # list(string) | required | A list of Kubernetes Namespaces.

    }

    restore_order { # list [0..1]

      group_kind_dependencies { # list [1..*]

        requiring { # list [1..1]
          resource_group = ""     # string | optional | API Group of a Kubernetes resource, e.g. "apiextensions.k8s.…
          resource_kind  = ""     # string | optional | Kind of a Kubernetes resource, e.g. "CustomResourceDefinitio…

        }

        satisfying { # list [1..1]
          resource_group = ""     # string | optional | API Group of a Kubernetes resource, e.g. "apiextensions.k8s.…
          resource_kind  = ""     # string | optional | Kind of a Kubernetes resource, e.g. "CustomResourceDefinitio…

        }

      }

    }

    selected_applications { # list [0..1]

      namespaced_names { # list [1..*]
        name      = ""     # string | required | The name of a Kubernetes Resource.
        namespace = ""     # string | required | The namespace of a Kubernetes Resource.

      }

    }

    selected_namespaces { # list [0..1]
      namespaces = []     # list(string) | required | A list of Kubernetes Namespaces.

    }

    transformation_rules { # list
      description = ""     # string | optional | The description is a user specified string description of th…

      field_actions { # list [1..*]
        op        = ""     # string | required | Specifies the operation to perform. Possible values: ["REMOV…
        from_path = ""     # string | optional | A string containing a JSON Pointer value that references the…
        path      = ""     # string | optional | A string containing a JSON-Pointer value that references a l…
        value     = ""     # string | optional | A string that specifies the desired value in string format t…

      }

      resource_filter { # list [0..1]
        json_path  = ""     # string | optional | This is a JSONPath expression that matches specific fields o…
        namespaces = []     # list(string) | optional | (Filtering parameter) Any resource subject to transformation…

        group_kinds { # list
          resource_group = ""     # string | optional | API Group string of a Kubernetes resource, e.g. "apiextensio…
          resource_kind  = ""     # string | optional | Kind of a Kubernetes resource, e.g. "CustomResourceDefinitio…

        }

      }

    }

    volume_data_restore_policy_bindings { # list
      policy      = ""     # string | required | Specifies the mechanism to be used to restore this volume da…
      volume_type = ""     # string | required | The volume type, as determined by the PVC's bound PV, to app…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

