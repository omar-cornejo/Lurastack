# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ami                                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ami" "this" {

  name                 = ""     # string | required
  architecture         = ""     # string | optional
  boot_mode            = ""     # string | optional
  deprecation_time     = ""     # string | optional
  description          = ""     # string | optional
  ena_support          = false  # bool | optional
  id                   = ""     # string | optional+computed
  image_location       = ""     # string | optional+computed
  imds_support         = ""     # string | optional
  kernel_id            = ""     # string | optional
  ramdisk_id           = ""     # string | optional
  root_device_name     = ""     # string | optional
  sriov_net_support    = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  tpm_support          = ""     # string | optional
  uefi_data            = ""     # string | optional
  virtualization_type  = ""     # string | optional

  # arn                  = ""     # string | computed
  # hypervisor           = ""     # string | computed
  # image_owner_alias    = ""     # string | computed
  # image_type           = ""     # string | computed
  # last_launched_time   = ""     # string | computed
  # manage_ebs_snapshots = false  # bool | computed
  # owner_id             = ""     # string | computed
  # platform             = ""     # string | computed
  # platform_details     = ""     # string | computed
  # public               = false  # bool | computed
  # root_snapshot_id     = ""     # string | computed
  # usage_operation      = ""     # string | computed

  ebs_block_device { # set
    device_name           = ""     # string | required
    delete_on_termination = false  # bool | optional
    encrypted             = false  # bool | optional
    iops                  = 0      # number | optional
    outpost_arn           = ""     # string | optional
    snapshot_id           = ""     # string | optional
    throughput            = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional

  }

  ephemeral_block_device { # set
    device_name  = ""     # string | required
    virtual_name = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

