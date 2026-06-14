# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_instance_group                           │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_instance_group" "this" {

  id          = ""     # string | optional+computed
  name        = ""     # string | optional
  project     = ""     # string | optional+computed
  self_link   = ""     # string | optional+computed
  zone        = ""     # string | optional+computed

  # description = ""     # string | computed
  # instances   = []     # set(string) | computed
  # named_port = [  # list(object)
  #   {
  #     name = ""
  #     port = 0
  #   }
  # ]
  # network     = ""     # string | computed
  # size        = 0      # number | computed

}

