# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_azure_cluster                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_azure_cluster" "this" {

  azure_region             = ""     # string | required | The Azure region where the cluster runs. Each Google Cloud r…
  location                 = ""     # string | required | The location for the resource
  name                     = ""     # string | required | The name of this resource.
  resource_group_id        = ""     # string | required | The ARM ID of the resource group where the cluster resources…
  annotations              = {}     # map(string) | optional | Optional. Annotations on the cluster. This field has the sam…
  client                   = ""     # string | optional | Name of the AzureClient. The `AzureClient` resource must res…
  description              = ""     # string | optional | Optional. A human readable description of this cluster. Cann…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed | The project for the resource

  # create_time              = ""     # string | computed | Output only. The time at which this cluster was created.
  # effective_annotations    = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # endpoint                 = ""     # string | computed | Output only. The endpoint of the cluster's API server.
  # etag                     = ""     # string | computed | Allows clients to perform consistent read-modify-writes thro…
  # reconciling              = false  # bool | computed | Output only. If set, there are currently changes in flight t…
  # state                    = ""     # string | computed | Output only. The current state of the cluster. Possible valu…
  # uid                      = ""     # string | computed | Output only. A globally unique identifier for the cluster.
  # update_time              = ""     # string | computed | Output only. The time at which this cluster was last updated…
  # workload_identity_config = [  # list(object)
  #   {
  #     identity_provider = ""
  #     issuer_uri = ""
  #     workload_pool = ""
  #   }
  # ]

  authorization { # list [1..1]

    admin_groups { # list
      group = ""     # string | required | The name of the group, e.g. `my-group@domain.com`.

    }

    admin_users { # list [1..*]
      username = ""     # string | required | The name of the user, e.g. `my-gcp-id@gmail.com`.

    }

  }

  azure_services_authentication { # list [0..1]
    application_id = ""     # string | required | The Azure Active Directory Application ID for Authentication…
    tenant_id      = ""     # string | required | The Azure Active Directory Tenant ID for Authentication conf…

  }

  control_plane { # list [1..1]
    subnet_id = ""     # string | required | The ARM ID of the subnet where the control plane VMs are dep…
    version   = ""     # string | required | The Kubernetes version to run on control plane replicas (e.g…
    tags      = {}     # map(string) | optional | Optional. A set of tags to apply to all underlying control p…
    vm_size   = ""     # string | optional+computed | Optional. The Azure VM size name. Example: `Standard_DS2_v2`…

    database_encryption { # list [0..1]
      key_id = ""     # string | required | The ARM ID of the Azure Key Vault key to encrypt / decrypt d…

    }

    main_volume { # list [0..1]
      size_gib = 0      # number | optional+computed | Optional. The size of the disk, in GiBs. When unspecified, a…

    }

    proxy_config { # list [0..1]
      resource_group_id = ""     # string | required | The ARM ID the of the resource group containing proxy keyvau…
      secret_id         = ""     # string | required | The URL the of the proxy setting secret with its version. Se…

    }

    replica_placements { # list
      azure_availability_zone = ""     # string | required | For a given replica, the Azure availability zone where to pr…
      subnet_id               = ""     # string | required | For a given replica, the ARM ID of the subnet where the cont…

    }

    root_volume { # list [0..1]
      size_gib = 0      # number | optional+computed | Optional. The size of the disk, in GiBs. When unspecified, a…

    }

    ssh_config { # list [1..1]
      authorized_key = ""     # string | required | The SSH public key data for VMs managed by Anthos. This acce…

    }

  }

  fleet { # list [1..1]
    project    = ""     # string | optional+computed | The number of the Fleet host project where this cluster will…

    # membership = ""     # string | computed | The name of the managed Hub Membership resource associated t…

  }

  networking { # list [1..1]
    pod_address_cidr_blocks     = []     # list(string) | required | The IP address range of the pods in this cluster, in CIDR no…
    service_address_cidr_blocks = []     # list(string) | required | The IP address range for services in this cluster, in CIDR n…
    virtual_network_id          = ""     # string | required | The Azure Resource Manager (ARM) ID of the VNet associated w…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

