# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_composer_image_versions                          │
# └──────────────────────────────────────────────────────────────┘
data "google_composer_image_versions" "this" {

  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional+computed

  # image_versions = [  # list(object)
  #   {
  #     image_version_id = ""
  #     supported_python_versions = []  # list(string)
  #   }
  # ]

}

