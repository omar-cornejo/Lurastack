# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudhsm_v2_cluster                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudhsm_v2_cluster" "this" {

  cluster_id           = ""     # string | required
  cluster_state        = ""     # string | optional+computed
  id                   = ""     # string | optional+computed

  # cluster_certificates = [  # list(object)
  #   {
  #     aws_hardware_certificate = ""
  #     cluster_certificate = ""
  #     cluster_csr = ""
  #     hsm_certificate = ""
  #     manufacturer_hardware_certificate = ""
  #   }
  # ]
  # security_group_id    = ""     # string | computed
  # subnet_ids           = []     # set(string) | computed
  # vpc_id               = ""     # string | computed

}

