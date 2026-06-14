# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_bootstrap_brokers                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_bootstrap_brokers" "this" {

  cluster_arn                                   = ""     # string | required
  id                                            = ""     # string | optional+computed

  # bootstrap_brokers                             = ""     # string | computed
  # bootstrap_brokers_public_sasl_iam             = ""     # string | computed
  # bootstrap_brokers_public_sasl_scram           = ""     # string | computed
  # bootstrap_brokers_public_tls                  = ""     # string | computed
  # bootstrap_brokers_sasl_iam                    = ""     # string | computed
  # bootstrap_brokers_sasl_scram                  = ""     # string | computed
  # bootstrap_brokers_tls                         = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_sasl_iam   = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_sasl_scram = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_tls        = ""     # string | computed

}

