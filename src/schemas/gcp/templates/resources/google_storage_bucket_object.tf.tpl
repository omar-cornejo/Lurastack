# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_bucket_object                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_bucket_object" "this" {

  bucket              = ""     # string | required | The name of the containing bucket.
  name                = ""     # string | required | The name of the object. If you're interpolating the name of …
  cache_control       = ""     # string | optional | Cache-Control directive to specify caching behavior of objec…
  content             = ""     # string | optional+computed+sensitive | Data as string to be uploaded. Must be defined if source is …
  content_disposition = ""     # string | optional | Content-Disposition of the object data.
  content_encoding    = ""     # string | optional | Content-Encoding of the object data.
  content_language    = ""     # string | optional | Content-Language of the object data.
  content_type        = ""     # string | optional+computed | Content-Type of the object data. Defaults to "application/oc…
  detect_md5hash      = ""     # string | optional
  event_based_hold    = false  # bool | optional | Whether an object is under event-based hold. Event-based hol…
  id                  = ""     # string | optional+computed
  kms_key_name        = ""     # string | optional+computed | Resource name of the Cloud KMS key that will be used to encr…
  metadata            = {}     # map(string) | optional | User-provided metadata, in key/value pairs.
  source              = ""     # string | optional | A path to the data you want to upload. Must be defined if co…
  storage_class       = ""     # string | optional+computed | The StorageClass of the new bucket object. Supported values …
  temporary_hold      = false  # bool | optional | Whether an object is under temporary hold. While this flag i…

  # crc32c              = ""     # string | computed | Base 64 CRC32 hash of the uploaded data.
  # generation          = 0      # number | computed | The content generation of this object. Used for object versi…
  # md5hash             = ""     # string | computed | Base 64 MD5 hash of the uploaded data.
  # media_link          = ""     # string | computed | A url reference to download this object.
  # output_name         = ""     # string | computed | The name of the object. Use this field in interpolations wit…
  # self_link           = ""     # string | computed | A url reference to this object.

  customer_encryption { # list [0..1]
    encryption_key       = ""     # string | required+sensitive | Base64 encoded customer supplied encryption key.
    encryption_algorithm = ""     # string | optional | The encryption algorithm. Default: AES256

  }

  retention { # list [0..1]
    mode              = ""     # string | required | The object retention mode. Supported values include: "Unlock…
    retain_until_time = ""     # string | required | Time in RFC 3339 (e.g. 2030-01-01T02:03:04Z) until which obj…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

