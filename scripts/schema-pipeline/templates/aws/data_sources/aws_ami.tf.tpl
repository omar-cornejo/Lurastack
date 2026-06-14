# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ami                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ami" "this" {

  executable_users      = []     # list(string) | optional
  id                    = ""     # string | optional+computed
  include_deprecated    = false  # bool | optional
  most_recent           = false  # bool | optional
  name_regex            = ""     # string | optional
  owners                = []     # list(string) | optional
  tags                  = {}     # map(string) | optional+computed
  uefi_data             = ""     # string | optional

  # architecture          = ""     # string | computed
  # arn                   = ""     # string | computed
  # block_device_mappings = [  # set(object)
  #   {
  #     device_name = ""
  #     ebs = {}  # map(string)
  #     no_device = ""
  #     virtual_name = ""
  #   }
  # ]
  # boot_mode             = ""     # string | computed
  # creation_date         = ""     # string | computed
  # deprecation_time      = ""     # string | computed
  # description           = ""     # string | computed
  # ena_support           = false  # bool | computed
  # hypervisor            = ""     # string | computed
  # image_id              = ""     # string | computed
  # image_location        = ""     # string | computed
  # image_owner_alias     = ""     # string | computed
  # image_type            = ""     # string | computed
  # imds_support          = ""     # string | computed
  # kernel_id             = ""     # string | computed
  # last_launched_time    = ""     # string | computed
  # name                  = ""     # string | computed
  # owner_id              = ""     # string | computed
  # platform              = ""     # string | computed
  # platform_details      = ""     # string | computed
  # product_codes = [  # set(object)
  #   {
  #     product_code_id = ""
  #     product_code_type = ""
  #   }
  # ]
  # public                = false  # bool | computed
  # ramdisk_id            = ""     # string | computed
  # root_device_name      = ""     # string | computed
  # root_device_type      = ""     # string | computed
  # root_snapshot_id      = ""     # string | computed
  # sriov_net_support     = ""     # string | computed
  # state                 = ""     # string | computed
  # state_reason          = {}     # map(string) | computed
  # tpm_support           = ""     # string | computed
  # usage_operation       = ""     # string | computed
  # virtualization_type   = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

