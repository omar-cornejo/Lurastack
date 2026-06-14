# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_file_cache                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_file_cache" "this" {

  file_cache_type                           = ""     # string | required
  file_cache_type_version                   = ""     # string | required
  storage_capacity                          = 0      # number | required
  subnet_ids                                = []     # list(string) | required
  copy_tags_to_data_repository_associations = false  # bool | optional
  id                                        = ""     # string | optional+computed
  kms_key_id                                = ""     # string | optional+computed
  security_group_ids                        = []     # set(string) | optional
  tags                                      = {}     # map(string) | optional
  tags_all                                  = {}     # map(string) | optional+computed

  # arn                                       = ""     # string | computed
  # data_repository_association_ids           = []     # set(string) | computed
  # dns_name                                  = ""     # string | computed
  # file_cache_id                             = ""     # string | computed
  # network_interface_ids                     = []     # set(string) | computed
  # owner_id                                  = ""     # string | computed
  # vpc_id                                    = ""     # string | computed

  data_repository_association { # set [0..8]
    data_repository_path           = ""     # string | required
    file_cache_path                = ""     # string | required
    data_repository_subdirectories = []     # set(string) | optional
    tags                           = {}     # map(string) | optional+computed

    # association_id                 = ""     # string | computed
    # file_cache_id                  = ""     # string | computed
    # file_system_id                 = ""     # string | computed
    # file_system_path               = ""     # string | computed
    # imported_file_chunk_size       = 0      # number | computed
    # resource_arn                   = ""     # string | computed

    nfs { # set
      version = ""     # string | required
      dns_ips = []     # set(string) | optional

    }

  }

  lustre_configuration { # set
    deployment_type               = ""     # string | required
    per_unit_storage_throughput   = 0      # number | required
    weekly_maintenance_start_time = ""     # string | optional

    # log_configuration = [  # set(object)
    #   {
    #     destination = ""
    #     level = ""
    #   }
    # ]
    # mount_name                    = ""     # string | computed

    metadata_configuration { # set [1..8]
      storage_capacity = 0      # number | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

