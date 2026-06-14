# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_emr_supported_instance_types                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_emr_supported_instance_types" "this" {

  release_label = ""     # string | required

  # id            = ""     # string | computed

  supported_instance_types { # list

    # architecture             = ""     # string | computed
    # ebs_optimized_available  = false  # bool | computed
    # ebs_optimized_by_default = false  # bool | computed
    # ebs_storage_only         = false  # bool | computed
    # instance_family_id       = ""     # string | computed
    # is_64_bits_only          = false  # bool | computed
    # memory_gb                = 0      # number | computed
    # number_of_disks          = 0      # number | computed
    # storage_gb               = 0      # number | computed
    # type                     = ""     # string | computed
    # vcpu                     = 0      # number | computed

  }

}

