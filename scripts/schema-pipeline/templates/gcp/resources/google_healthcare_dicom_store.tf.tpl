# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_dicom_store                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_dicom_store" "this" {

  dataset          = ""     # string | required | Identifies the dataset addressed by this request. Must be in…
  name             = ""     # string | required | The resource name for the DicomStore.  ** Changing this prop…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-supplied key-value pairs used to organize DICOM stores.…

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # self_link        = ""     # string | computed | The fully qualified name of this dataset
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  notification_config { # list [0..1]
    pubsub_topic         = ""     # string | required | The Cloud Pub/Sub topic that notifications of changes are pu…
    send_for_bulk_import = false  # bool | optional | Indicates whether or not to send Pub/Sub notifications on bu…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

