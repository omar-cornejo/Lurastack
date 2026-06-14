# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_region_disk                              │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_region_disk" "this" {

  name                           = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                             = ""     # string | optional+computed
  project                        = ""     # string | optional
  region                         = ""     # string | optional | A reference to the region where the disk resides.

  # async_primary_disk = [  # list(object)
  #   {
  #     disk = ""
  #   }
  # ]
  # creation_timestamp             = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                    = ""     # string | computed | An optional description of this resource. Provide this prope…
  # disk_encryption_key = [  # list(object)
  #   {
  #     kms_key_name = ""
  #     raw_key = ""
  #     sha256 = ""
  #   }
  # ]
  # effective_labels               = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # guest_os_features = [  # set(object)
  #   {
  #     type = ""
  #   }
  # ]
  # label_fingerprint              = ""     # string | computed | The fingerprint used for optimistic locking of this resource…
  # labels                         = {}     # map(string) | computed | Labels to apply to this disk.  A list of key->value pairs.  …
  # last_attach_timestamp          = ""     # string | computed | Last attach timestamp in RFC3339 text format.
  # last_detach_timestamp          = ""     # string | computed | Last detach timestamp in RFC3339 text format.
  # licenses                       = []     # list(string) | computed | Any applicable license URI.
  # physical_block_size_bytes      = 0      # number | computed | Physical block size of the persistent disk, in bytes. If not…
  # replica_zones                  = []     # list(string) | computed | URLs of the zones where the disk should be replicated to.
  # self_link                      = ""     # string | computed
  # size                           = 0      # number | computed | Size of the persistent disk, specified in GB. You can specif…
  # snapshot                       = ""     # string | computed | The source snapshot used to create this disk. You can provid…
  # source_disk                    = ""     # string | computed | The source disk used to create this disk. You can provide th…
  # source_disk_id                 = ""     # string | computed | The ID value of the disk used to create this image. This val…
  # source_snapshot_encryption_key = [  # list(object)
  #   {
  #     raw_key = ""
  #     sha256 = ""
  #   }
  # ]
  # source_snapshot_id             = ""     # string | computed | The unique ID of the snapshot used to create this disk. This…
  # terraform_labels               = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type                           = ""     # string | computed | URL of the disk type resource describing which disk type to …
  # users                          = []     # list(string) | computed | Links to the users of the disk (attached instances) in form:…

}

