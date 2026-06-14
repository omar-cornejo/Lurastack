# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_filestore_instance                               │
# └──────────────────────────────────────────────────────────────┘
data "google_filestore_instance" "this" {

  name             = ""     # string | required | The resource name of the instance.
  id               = ""     # string | optional+computed
  location         = ""     # string | optional | The name of the location of the instance. This can be a regi…
  project          = ""     # string | optional

  # create_time      = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description      = ""     # string | computed | A description of the instance.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Server-specified ETag for the instance resource to prevent s…
  # file_shares = [  # list(object)
  #   {
  #     capacity_gb = 0
  #     name = ""
  #     nfs_export_options = [  # list(object)
  #       {
  #         access_mode = ""
  #         anon_gid = 0
  #         anon_uid = 0
  #         ip_ranges = []  # list(string)
  #         squash_mode = ""
  #       }
  #     ]
  #     source_backup = ""
  #   }
  # ]
  # kms_key_name     = ""     # string | computed | KMS key name used for data encryption.
  # labels           = {}     # map(string) | computed | Resource labels to represent user-provided metadata.   **Not…
  # networks = [  # list(object)
  #   {
  #     connect_mode = ""
  #     ip_addresses = []  # list(string)
  #     modes = []  # list(string)
  #     network = ""
  #     reserved_ip_range = ""
  #   }
  # ]
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # tier             = ""     # string | computed | The service tier of the instance. Possible values include: S…
  # zone             = ""     # string | computed | The name of the Filestore zone of the instance.

}

