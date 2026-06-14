# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_bucket_object                            │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_bucket_object" "this" {

  bucket              = ""     # string | optional | The name of the containing bucket.
  id                  = ""     # string | optional+computed
  name                = ""     # string | optional | The name of the object. If you're interpolating the name of …

  # cache_control       = ""     # string | computed | Cache-Control directive to specify caching behavior of objec…
  # content             = ""     # string | computed | Data as string to be uploaded. Must be defined if source is …
  # content_disposition = ""     # string | computed | Content-Disposition of the object data.
  # content_encoding    = ""     # string | computed | Content-Encoding of the object data.
  # content_language    = ""     # string | computed | Content-Language of the object data.
  # content_type        = ""     # string | computed | Content-Type of the object data. Defaults to "application/oc…
  # crc32c              = ""     # string | computed | Base 64 CRC32 hash of the uploaded data.
  # customer_encryption = [  # list(object)
  #   {
  #     encryption_algorithm = ""
  #     encryption_key = ""
  #   }
  # ]
  # detect_md5hash      = ""     # string | computed
  # event_based_hold    = false  # bool | computed | Whether an object is under event-based hold. Event-based hol…
  # generation          = 0      # number | computed | The content generation of this object. Used for object versi…
  # kms_key_name        = ""     # string | computed | Resource name of the Cloud KMS key that will be used to encr…
  # md5hash             = ""     # string | computed | Base 64 MD5 hash of the uploaded data.
  # media_link          = ""     # string | computed | A url reference to download this object.
  # metadata            = {}     # map(string) | computed | User-provided metadata, in key/value pairs.
  # output_name         = ""     # string | computed | The name of the object. Use this field in interpolations wit…
  # retention = [  # list(object)
  #   {
  #     mode = ""
  #     retain_until_time = ""
  #   }
  # ]
  # self_link           = ""     # string | computed | A url reference to this object.
  # source              = ""     # string | computed | A path to the data you want to upload. Must be defined if co…
  # storage_class       = ""     # string | computed | The StorageClass of the new bucket object. Supported values …
  # temporary_hold      = false  # bool | computed | Whether an object is under temporary hold. While this flag i…

}

