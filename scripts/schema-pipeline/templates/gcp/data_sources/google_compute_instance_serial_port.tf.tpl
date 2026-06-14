# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_instance_serial_port                     │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_instance_serial_port" "this" {

  instance = ""     # string | required
  port     = 0      # number | required
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed
  zone     = ""     # string | optional+computed

  # contents = ""     # string | computed

}

