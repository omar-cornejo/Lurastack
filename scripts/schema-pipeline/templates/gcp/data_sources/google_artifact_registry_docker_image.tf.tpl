# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_artifact_registry_docker_image                   │
# └──────────────────────────────────────────────────────────────┘
data "google_artifact_registry_docker_image" "this" {

  image_name       = ""     # string | required | The image name to fetch.
  location         = ""     # string | required | The region of the artifact registry repository. For example,…
  repository_id    = ""     # string | required | The last part of the repository name to fetch from.
  id               = ""     # string | optional+computed
  project          = ""     # string | optional | Project ID of the project.

  # build_time       = ""     # string | computed | The time, as a RFC 3339 string, this image was built.
  # image_size_bytes = ""     # string | computed | Calculated size of the image in bytes.
  # media_type       = ""     # string | computed | Media type of this image.
  # name             = ""     # string | computed | The fully qualified name of the fetched image.
  # self_link        = ""     # string | computed | The URI to access the image.
  # tags             = []     # list(string) | computed | All tags associated with the image.
  # update_time      = ""     # string | computed | The time, as a RFC 3339 string, this image was updated.
  # upload_time      = ""     # string | computed | The time, as a RFC 3339 string, the image was uploaded.

}

