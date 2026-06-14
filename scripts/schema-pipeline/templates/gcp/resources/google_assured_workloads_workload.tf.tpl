# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_assured_workloads_workload                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_assured_workloads_workload" "this" {

  compliance_regime                 = ""     # string | required | Required. Immutable. Compliance Regime associated with this …
  display_name                      = ""     # string | required | Required. The user-assigned display name of the Workload. Wh…
  location                          = ""     # string | required | The location for the resource
  organization                      = ""     # string | required | The organization for the resource
  billing_account                   = ""     # string | optional | Optional. Input only. The billing account used for the resou…
  enable_sovereign_controls         = false  # bool | optional | Optional. Indicates the sovereignty status of the given work…
  id                                = ""     # string | optional+computed
  labels                            = {}     # map(string) | optional | Optional. Labels applied to the workload.  **Note**: This fi…
  partner                           = ""     # string | optional | Optional. Partner regime associated with this workload. Poss…
  provisioned_resources_parent      = ""     # string | optional | Input only. The parent resource for the resources managed by…
  violation_notifications_enabled   = false  # bool | optional+computed | Optional. Indicates whether the e-mail notification for a vi…

  # compliance_status = [  # list(object)
  #   {
  #     acknowledged_violation_count = []  # list(number)
  #     active_violation_count = []  # list(number)
  #   }
  # ]
  # compliant_but_disallowed_services = []     # list(string) | computed | Output only. Urls for services which are compliant for this …
  # create_time                       = ""     # string | computed | Output only. Immutable. The Workload creation timestamp.
  # effective_labels                  = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # ekm_provisioning_response = [  # list(object)
  #   {
  #     ekm_provisioning_error_domain = ""
  #     ekm_provisioning_error_mapping = ""
  #     ekm_provisioning_state = ""
  #   }
  # ]
  # kaj_enrollment_state              = ""     # string | computed | Output only. Represents the KAJ enrollment state of the give…
  # name                              = ""     # string | computed | Output only. The resource name of the workload.
  # resources = [  # list(object)
  #   {
  #     resource_id = 0
  #     resource_type = ""
  #   }
  # ]
  # saa_enrollment_response = [  # list(object)
  #   {
  #     setup_errors = []  # list(string)
  #     setup_status = ""
  #   }
  # ]
  # terraform_labels                  = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  kms_settings { # list [0..1]
    next_rotation_time = ""     # string | required | Required. Input only. Immutable. The time at which the Key M…
    rotation_period    = ""     # string | required | Required. Input only. Immutable. will be advanced by this pe…

  }

  partner_permissions { # list [0..1]
    assured_workloads_monitoring = false  # bool | optional | Optional. Allow partner to view violation alerts.
    data_logs_viewer             = false  # bool | optional | Allow the partner to view inspectability logs and monitoring…
    service_access_approver      = false  # bool | optional | Optional. Allow partner to view access approval logs.

  }

  resource_settings { # list
    display_name  = ""     # string | optional | User-assigned resource display name. If not empty it will be…
    resource_id   = ""     # string | optional | Resource identifier. For a project this represents projectId…
    resource_type = ""     # string | optional | Indicates the type of resource. This field should be specifi…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

