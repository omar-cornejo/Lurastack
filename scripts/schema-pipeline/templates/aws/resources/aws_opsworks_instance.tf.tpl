# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_instance                               │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_instance" "this" {

  layer_ids                    = []     # list(string) | required
  stack_id                     = ""     # string | required
  agent_version                = ""     # string | optional
  ami_id                       = ""     # string | optional+computed
  architecture                 = ""     # string | optional
  auto_scaling_type            = ""     # string | optional
  availability_zone            = ""     # string | optional+computed
  created_at                   = ""     # string | optional+computed
  delete_ebs                   = false  # bool | optional
  delete_eip                   = false  # bool | optional
  ebs_optimized                = false  # bool | optional
  ecs_cluster_arn              = ""     # string | optional+computed
  elastic_ip                   = ""     # string | optional+computed
  hostname                     = ""     # string | optional+computed
  id                           = ""     # string | optional+computed
  infrastructure_class         = ""     # string | optional+computed
  install_updates_on_boot      = false  # bool | optional
  instance_profile_arn         = ""     # string | optional+computed
  instance_type                = ""     # string | optional
  os                           = ""     # string | optional+computed
  root_device_type             = ""     # string | optional+computed
  security_group_ids           = []     # list(string) | optional+computed
  ssh_key_name                 = ""     # string | optional+computed
  state                        = ""     # string | optional
  status                       = ""     # string | optional+computed
  subnet_id                    = ""     # string | optional+computed
  tenancy                      = ""     # string | optional+computed
  virtualization_type          = ""     # string | optional+computed

  # ec2_instance_id              = ""     # string | computed
  # last_service_error_id        = ""     # string | computed
  # platform                     = ""     # string | computed
  # private_dns                  = ""     # string | computed
  # private_ip                   = ""     # string | computed
  # public_dns                   = ""     # string | computed
  # public_ip                    = ""     # string | computed
  # registered_by                = ""     # string | computed
  # reported_agent_version       = ""     # string | computed
  # reported_os_family           = ""     # string | computed
  # reported_os_name             = ""     # string | computed
  # reported_os_version          = ""     # string | computed
  # root_device_volume_id        = ""     # string | computed
  # ssh_host_dsa_key_fingerprint = ""     # string | computed
  # ssh_host_rsa_key_fingerprint = ""     # string | computed

  ebs_block_device { # set
    device_name           = ""     # string | required
    delete_on_termination = false  # bool | optional
    iops                  = 0      # number | optional+computed
    snapshot_id           = ""     # string | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed

  }

  ephemeral_block_device { # set
    device_name  = ""     # string | required
    virtual_name = ""     # string | required

  }

  root_block_device { # set
    delete_on_termination = false  # bool | optional
    iops                  = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

