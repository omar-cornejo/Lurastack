# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_disk                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_disk" "this" {

  name                           = ""     # string | required | Name of the resource. Provided by the client when the resour…
  id                             = ""     # string | optional+computed
  project                        = ""     # string | optional
  zone                           = ""     # string | optional | A reference to the zone where the disk resides.

  # access_mode                    = ""     # string | computed | The accessMode of the disk. For example: * READ_WRITE_SINGLE…
  # async_primary_disk = [  # list(object)
  #   {
  #     disk = ""
  #   }
  # ]
  # creation_timestamp             = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                    = ""     # string | computed | An optional description of this resource. Provide this prope…
  # disk_encryption_key = [  # list(object)
  #   {
  #     kms_key_self_link = ""
  #     kms_key_service_account = ""
  #     raw_key = ""
  #     rsa_encrypted_key = ""
  #     sha256 = ""
  #   }
  # ]
  # disk_id                        = ""     # string | computed | The unique identifier for the resource. This identifier is d…
  # effective_labels               = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # enable_confidential_compute    = false  # bool | computed | Whether this disk is using confidential compute mode. Note: …
  # guest_os_features = [  # set(object)
  #   {
  #     type = ""
  #   }
  # ]
  # image                          = ""     # string | computed | The image from which to initialize this disk. This can be on…
  # label_fingerprint              = ""     # string | computed | The fingerprint used for optimistic locking of this resource…
  # labels                         = {}     # map(string) | computed | Labels to apply to this disk.  A list of key->value pairs.  …
  # last_attach_timestamp          = ""     # string | computed | Last attach timestamp in RFC3339 text format.
  # last_detach_timestamp          = ""     # string | computed | Last detach timestamp in RFC3339 text format.
  # licenses                       = []     # list(string) | computed | Any applicable license URI.
  # physical_block_size_bytes      = 0      # number | computed | Physical block size of the persistent disk, in bytes. If not…
  # provisioned_iops               = 0      # number | computed | Indicates how many IOPS must be provisioned for the disk. No…
  # provisioned_throughput         = 0      # number | computed | Indicates how much Throughput must be provisioned for the di…
  # self_link                      = ""     # string | computed
  # size                           = 0      # number | computed | Size of the persistent disk, specified in GB. You can specif…
  # snapshot                       = ""     # string | computed | The source snapshot used to create this disk. You can provid…
  # source_disk                    = ""     # string | computed | The source disk used to create this disk. You can provide th…
  # source_disk_id                 = ""     # string | computed | The ID value of the disk used to create this image. This val…
  # source_image_encryption_key = [  # list(object)
  #   {
  #     kms_key_self_link = ""
  #     kms_key_service_account = ""
  #     raw_key = ""
  #     sha256 = ""
  #   }
  # ]
  # source_image_id                = ""     # string | computed | The ID value of the image used to create this disk. This val…
  # source_snapshot_encryption_key = [  # list(object)
  #   {
  #     kms_key_self_link = ""
  #     kms_key_service_account = ""
  #     raw_key = ""
  #     sha256 = ""
  #   }
  # ]
  # source_snapshot_id             = ""     # string | computed | The unique ID of the snapshot used to create this disk. This…
  # storage_pool                   = ""     # string | computed | The URL of the storage pool in which the new disk is created…
  # terraform_labels               = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type                           = ""     # string | computed | URL of the disk type resource describing which disk type to …
  # users                          = []     # list(string) | computed | Links to the users of the disk (attached instances) in form:…

}

