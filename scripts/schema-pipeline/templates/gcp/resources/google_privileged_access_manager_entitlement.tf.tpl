# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_privileged_access_manager_entitlement        │
# └──────────────────────────────────────────────────────────────┘
resource "google_privileged_access_manager_entitlement" "this" {

  entitlement_id       = ""     # string | required | The ID to use for this Entitlement. This will become the las…
  location             = ""     # string | required | The region of the Entitlement resource.
  max_request_duration = ""     # string | required | The maximum amount of time for which access would be granted…
  parent               = ""     # string | required | Format: projects/{project-id|project-number} or organization…
  id                   = ""     # string | optional+computed

  # create_time          = ""     # string | computed | Output only. Create time stamp. A timestamp in RFC3339 UTC "…
  # etag                 = ""     # string | computed | For Resource freshness validation (https://google.aip.dev/15…
  # name                 = ""     # string | computed | Output Only. The entitlement's name follows a hierarchical s…
  # state                = ""     # string | computed | Output only. The current state of the Entitlement.
  # update_time          = ""     # string | computed | Output only. Update time stamp. A timestamp in RFC3339 UTC "…

  additional_notification_targets { # list [0..1]
    admin_email_recipients     = []     # set(string) | optional | Optional. Additional email addresses to be notified when a p…
    requester_email_recipients = []     # set(string) | optional | Optional. Additional email address to be notified about an e…

  }

  approval_workflow { # list [0..1]

    manual_approvals { # list [1..1]
      require_approver_justification = false  # bool | optional | Optional. Do the approvers need to provide a justification f…

      steps { # list [1..*]
        approvals_needed          = 0      # number | optional | How many users from the above list need to approve. If there…
        approver_email_recipients = []     # set(string) | optional | Optional. Additional email addresses to be notified when a g…

        approvers { # list [1..1]
          principals = []     # set(string) | required | Users who are being allowed for the operation. Each entry sh…

        }

      }

    }

  }

  eligible_users { # list [1..*]
    principals = []     # set(string) | required | Users who are being allowed for the operation. Each entry sh…

  }

  privileged_access { # list [1..1]

    gcp_iam_access { # list [1..1]
      resource      = ""     # string | required | Name of the resource.
      resource_type = ""     # string | required | The type of this resource.

      role_bindings { # list [1..*]
        role                 = ""     # string | required | IAM role to be granted. https://cloud.google.com/iam/docs/ro…
        condition_expression = ""     # string | optional | The expression field of the IAM condition to be associated w…

      }

    }

  }

  requester_justification_config { # list [1..1]

    not_mandatory {} # list [0..1]

    unstructured {} # list [0..1]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

