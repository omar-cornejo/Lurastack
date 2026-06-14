# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_ontap_storage_virtual_machine               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_ontap_storage_virtual_machine" "this" {

  file_system_id             = ""     # string | required
  name                       = ""     # string | required
  id                         = ""     # string | optional+computed
  root_volume_security_style = ""     # string | optional
  svm_admin_password         = ""     # string | optional+sensitive
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # endpoints = [  # list(object)
  #   {
  #     iscsi = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #     management = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #     nfs = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #     smb = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # subtype                    = ""     # string | computed
  # uuid                       = ""     # string | computed

  active_directory_configuration { # list [0..1]
    netbios_name = ""     # string | optional

    self_managed_active_directory_configuration { # list [0..1]
      dns_ips                                = []     # set(string) | required
      domain_name                            = ""     # string | required
      password                               = ""     # string | required+sensitive
      username                               = ""     # string | required
      file_system_administrators_group       = ""     # string | optional
      organizational_unit_distinguished_name = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

