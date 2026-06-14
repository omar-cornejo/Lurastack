# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secure_source_manager_instance               │
# └──────────────────────────────────────────────────────────────┘
resource "google_secure_source_manager_instance" "this" {

  instance_id      = ""     # string | required | The name for the Instance.
  location         = ""     # string | required | The location for the Instance.
  id               = ""     # string | optional+computed
  kms_key          = ""     # string | optional | Customer-managed encryption key name, in the format projects…
  labels           = {}     # map(string) | optional | Labels as key value pairs.   **Note**: This field is non-aut…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Time the Instance was created in UTC.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # host_config = [  # list(object)
  #   {
  #     api = ""
  #     git_http = ""
  #     git_ssh = ""
  #     html = ""
  #   }
  # ]
  # name             = ""     # string | computed | The resource name for the Instance.
  # state            = ""     # string | computed | The current state of the Instance.
  # state_note       = ""     # string | computed | Provides information about the current instance state.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | Time the Instance was updated in UTC.

  private_config { # list [0..1]
    ca_pool                 = ""     # string | required | CA pool resource, resource must in the format of 'projects/{…
    is_private              = false  # bool | required | 'Indicate if it's private instance.'

    # http_service_attachment = ""     # string | computed | Service Attachment for HTTP, resource is in the format of 'p…
    # ssh_service_attachment  = ""     # string | computed | Service Attachment for SSH, resource is in the format of 'pr…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

