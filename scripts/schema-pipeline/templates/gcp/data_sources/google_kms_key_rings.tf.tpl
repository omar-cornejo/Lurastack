# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_key_rings                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_key_rings" "this" {

  location  = ""     # string | required | The canonical id for the location. For example: "us-east1".
  filter    = ""     # string | optional |  					The filter argument is used to add a filter query para…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional | Project ID of the project.

  # key_rings = [  # list(object)
  #   {
  #     id = ""
  #     name = ""
  #   }
  # ]

}

