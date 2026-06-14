# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fsx_ontap_storage_virtual_machine                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_fsx_ontap_storage_virtual_machine" "this" {

  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional+computed

  # active_directory_configuration = [  # list(object)
  #   {
  #     netbios_name = ""
  #     self_managed_active_directory_configuration = [  # list(object)
  #       {
  #         dns_ips = []  # set(string)
  #         domain_name = ""
  #         file_system_administrators_group = ""
  #         organizational_unit_distinguished_name = ""
  #         username = ""
  #       }
  #     ]
  #   }
  # ]
  # arn                            = ""     # string | computed
  # creation_time                  = ""     # string | computed
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
  # file_system_id                 = ""     # string | computed
  # lifecycle_status               = ""     # string | computed
  # lifecycle_transition_reason = [  # set(object)
  #   {
  #     message = ""
  #   }
  # ]
  # name                           = ""     # string | computed
  # subtype                        = ""     # string | computed
  # uuid                           = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}

