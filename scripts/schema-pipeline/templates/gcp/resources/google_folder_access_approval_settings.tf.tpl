# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_folder_access_approval_settings              │
# └──────────────────────────────────────────────────────────────┘
resource "google_folder_access_approval_settings" "this" {

  folder_id                       = ""     # string | required | ID of the folder of the access approval settings.
  active_key_version              = ""     # string | optional | The asymmetric crypto key version to use for signing approva…
  id                              = ""     # string | optional+computed
  notification_emails             = []     # set(string) | optional+computed | A list of email addresses to which notifications relating to…

  # ancestor_has_active_key_version = false  # bool | computed | If the field is true, that indicates that an ancestor of thi…
  # enrolled_ancestor               = false  # bool | computed | If the field is true, that indicates that at least one servi…
  # invalid_key_version             = false  # bool | computed | If the field is true, that indicates that there is some conf…
  # name                            = ""     # string | computed | The resource name of the settings. Format is "folders/{folde…

  enrolled_services { # set [1..*]
    cloud_product    = ""     # string | required | The product for which Access Approval will be enrolled. Allo…
    enrollment_level = ""     # string | optional | The enrollment level of the service. Default value: "BLOCK_A…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

