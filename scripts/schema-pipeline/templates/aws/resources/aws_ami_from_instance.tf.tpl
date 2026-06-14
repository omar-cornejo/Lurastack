# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ami_from_instance                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ami_from_instance" "this" {

  name                    = ""     # string | required
  source_instance_id      = ""     # string | required
  deprecation_time        = ""     # string | optional
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  snapshot_without_reboot = false  # bool | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # architecture            = ""     # string | computed
  # arn                     = ""     # string | computed
  # boot_mode               = ""     # string | computed
  # ena_support             = false  # bool | computed
  # hypervisor              = ""     # string | computed
  # image_location          = ""     # string | computed
  # image_owner_alias       = ""     # string | computed
  # image_type              = ""     # string | computed
  # imds_support            = ""     # string | computed
  # kernel_id               = ""     # string | computed
  # last_launched_time      = ""     # string | computed
  # manage_ebs_snapshots    = false  # bool | computed
  # owner_id                = ""     # string | computed
  # platform                = ""     # string | computed
  # platform_details        = ""     # string | computed
  # public                  = false  # bool | computed
  # ramdisk_id              = ""     # string | computed
  # root_device_name        = ""     # string | computed
  # root_snapshot_id        = ""     # string | computed
  # sriov_net_support       = ""     # string | computed
  # tpm_support             = ""     # string | computed
  # uefi_data               = ""     # string | computed
  # usage_operation         = ""     # string | computed
  # virtualization_type     = ""     # string | computed

  ebs_block_device { # set

    # delete_on_termination = false  # bool | computed
    # device_name           = ""     # string | computed
    # encrypted             = false  # bool | computed
    # iops                  = 0      # number | computed
    # outpost_arn           = ""     # string | computed
    # snapshot_id           = ""     # string | computed
    # throughput            = 0      # number | computed
    # volume_size           = 0      # number | computed
    # volume_type           = ""     # string | computed

  }

  ephemeral_block_device { # set

    # device_name  = ""     # string | computed
    # virtual_name = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

