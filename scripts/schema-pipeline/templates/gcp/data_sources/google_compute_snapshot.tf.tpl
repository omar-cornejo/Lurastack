# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_snapshot                                 │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_snapshot" "this" {

  filter                     = ""     # string | optional
  id                         = ""     # string | optional+computed
  most_recent                = false  # bool | optional
  name                       = ""     # string | optional | Name of the resource; provided by the client when the resour…
  project                    = ""     # string | optional

  # chain_name                 = ""     # string | computed | Creates the new snapshot in the snapshot chain labeled with …
  # creation_timestamp         = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                = ""     # string | computed | An optional description of this resource.
  # disk_size_gb               = 0      # number | computed | Size of the snapshot, specified in GB.
  # effective_labels           = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # label_fingerprint          = ""     # string | computed | The fingerprint used for optimistic locking of this resource…
  # labels                     = {}     # map(string) | computed | Labels to apply to this Snapshot.  **Note**: This field is n…
  # licenses                   = []     # list(string) | computed | A list of public visible licenses that apply to this snapsho…
  # self_link                  = ""     # string | computed
  # snapshot_encryption_key = [  # list(object)
  #   {
  #     kms_key_self_link = ""
  #     kms_key_service_account = ""
  #     raw_key = ""
  #     sha256 = ""
  #   }
  # ]
  # snapshot_id                = 0      # number | computed | The unique identifier for the resource.
  # source_disk                = ""     # string | computed | A reference to the disk used to create this snapshot.
  # source_disk_encryption_key = [  # list(object)
  #   {
  #     kms_key_service_account = ""
  #     raw_key = ""
  #   }
  # ]
  # storage_bytes              = 0      # number | computed | A size of the storage used by the snapshot. As snapshots sha…
  # storage_locations          = []     # list(string) | computed | Cloud Storage bucket storage location of the snapshot (regio…
  # terraform_labels           = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # zone                       = ""     # string | computed | A reference to the zone where the disk is hosted.

}

