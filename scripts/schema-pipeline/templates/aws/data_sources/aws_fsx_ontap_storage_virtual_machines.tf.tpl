# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fsx_ontap_storage_virtual_machines                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_fsx_ontap_storage_virtual_machines" "this" {

  id  = ""     # string | optional+computed

  # ids = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

