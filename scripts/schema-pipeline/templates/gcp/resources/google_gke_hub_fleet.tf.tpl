# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_fleet                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_fleet" "this" {

  display_name = ""     # string | optional | A user-assigned display name of the Fleet. When present, it …
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # create_time  = ""     # string | computed | The time the fleet was created, in RFC3339 text format.
  # delete_time  = ""     # string | computed | The time the fleet was deleted, in RFC3339 text format.
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # uid          = ""     # string | computed | Google-generated UUID for this resource. This is unique acro…
  # update_time  = ""     # string | computed | The time the fleet was last updated, in RFC3339 text format.

  default_cluster_config { # list [0..1]

    binary_authorization_config { # list [0..1]
      evaluation_mode = ""     # string | optional | Mode of operation for binauthz policy evaluation. Possible v…

      policy_bindings { # list
        name = ""     # string | optional | The relative resource name of the binauthz platform policy t…

      }

    }

    security_posture_config { # list [0..1]
      mode               = ""     # string | optional | Sets which mode to use for Security Posture features. Possib…
      vulnerability_mode = ""     # string | optional | Sets which mode to use for vulnerability scanning. Possible …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

