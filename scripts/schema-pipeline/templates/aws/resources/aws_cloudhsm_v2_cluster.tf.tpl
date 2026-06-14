# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudhsm_v2_cluster                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudhsm_v2_cluster" "this" {

  hsm_type                 = ""     # string | required
  subnet_ids               = []     # set(string) | required
  id                       = ""     # string | optional+computed
  mode                     = ""     # string | optional+computed
  source_backup_identifier = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # cluster_certificates = [  # list(object)
  #   {
  #     aws_hardware_certificate = ""
  #     cluster_certificate = ""
  #     cluster_csr = ""
  #     hsm_certificate = ""
  #     manufacturer_hardware_certificate = ""
  #   }
  # ]
  # cluster_id               = ""     # string | computed
  # cluster_state            = ""     # string | computed
  # security_group_id        = ""     # string | computed
  # vpc_id                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

