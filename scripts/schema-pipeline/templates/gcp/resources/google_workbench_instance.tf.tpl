# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_workbench_instance                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_workbench_instance" "this" {

  location             = ""     # string | required | Part of 'parent'. See documentation of 'projectsId'.
  name                 = ""     # string | required | The name of this workbench instance. Format: 'projects/{proj…
  desired_state        = ""     # string | optional | Desired state of the Workbench Instance. Set this field to '…
  disable_proxy_access = false  # bool | optional | Optional. If true, the workbench instance will not register …
  id                   = ""     # string | optional+computed
  instance_id          = ""     # string | optional | Required. User-defined unique ID of this instance.
  instance_owners      = []     # list(string) | optional | 'Optional. Input only. The owner of this instance after crea…
  labels               = {}     # map(string) | optional | Optional. Labels to apply to this instance. These can be lat…
  project              = ""     # string | optional+computed

  # create_time          = ""     # string | computed | An RFC3339 timestamp in UTC time. This in the format of yyyy…
  # creator              = ""     # string | computed | Output only. Email address of entity that sent original Crea…
  # effective_labels     = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # health_info = [  # list(object)
  #   {
  #   }
  # ]
  # health_state         = ""     # string | computed | Output only. Instance health_state.
  # proxy_uri            = ""     # string | computed | Output only. The proxy endpoint that is used to access the J…
  # state                = ""     # string | computed | Output only. The state of this instance.
  # terraform_labels     = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time          = ""     # string | computed | An RFC3339 timestamp in UTC time. This in the format of yyyy…
  # upgrade_history = [  # list(object)
  #   {
  #     action = ""
  #     container_image = ""
  #     create_time = ""
  #     framework = ""
  #     snapshot = ""
  #     state = ""
  #     target_version = ""
  #     version = ""
  #     vm_image = ""
  #   }
  # ]

  gce_setup { # list [0..1]
    disable_public_ip    = false  # bool | optional+computed | Optional. If true, no external IP will be assigned to this V…
    enable_ip_forwarding = false  # bool | optional | Optional. Flag to enable ip forwarding or not, default false…
    machine_type         = ""     # string | optional+computed | Optional. The machine type of the VM instance. https://cloud…
    metadata             = {}     # map(string) | optional+computed | Optional. Custom metadata to apply to this instance.
    tags                 = []     # list(string) | optional+computed | Optional. The Compute Engine tags to add to instance (see [T…

    accelerator_configs { # list
      core_count = ""     # string | optional | Optional. Count of cores of this accelerator.
      type       = ""     # string | optional | Optional. Type of this accelerator. Possible values: ["NVIDI…

    }

    boot_disk { # list [0..1]
      disk_encryption = ""     # string | optional+computed | Optional. Input only. Disk encryption method used on the boo…
      disk_size_gb    = ""     # string | optional+computed | Optional. The size of the boot disk in GB attached to this i…
      disk_type       = ""     # string | optional+computed | Optional. Indicates the type of the disk. Possible values: […
      kms_key         = ""     # string | optional | 'Optional. The KMS key used to encrypt the disks, only appli…

    }

    container_image { # list [0..1]
      repository = ""     # string | required | The path to the container image repository. For example: gcr…
      tag        = ""     # string | optional | The tag of the container image. If not specified, this defau…

    }

    data_disks { # list [0..1]
      disk_encryption = ""     # string | optional+computed | Optional. Input only. Disk encryption method used on the boo…
      disk_size_gb    = ""     # string | optional+computed | Optional. The size of the disk in GB attached to this VM ins…
      disk_type       = ""     # string | optional | Optional. Input only. Indicates the type of the disk. Possib…
      kms_key         = ""     # string | optional | 'Optional. The KMS key used to encrypt the disks, only appli…

    }

    network_interfaces { # list
      network  = ""     # string | optional+computed | Optional. The name of the VPC that this VM instance is in.
      nic_type = ""     # string | optional | Optional. The type of vNIC to be used on this interface. Thi…
      subnet   = ""     # string | optional+computed | Optional. The name of the subnet that this VM instance is in…

      access_configs { # list
        external_ip = ""     # string | required | An external IP address associated with this instance. Specif…

      }

    }

    service_accounts { # list
      email  = ""     # string | optional+computed | Optional. Email address of the service account.

      # scopes = []     # list(string) | computed | Output only. The list of scopes to be made available for thi…

    }

    shielded_instance_config { # list [0..1]
      enable_integrity_monitoring = false  # bool | optional | Optional. Defines whether the VM instance has integrity moni…
      enable_secure_boot          = false  # bool | optional | Optional. Defines whether the VM instance has Secure Boot en…
      enable_vtpm                 = false  # bool | optional | Optional. Defines whether the VM instance has the vTPM enabl…

    }

    vm_image { # list [0..1]
      family  = ""     # string | optional | Optional. Use this VM image family to find the image; the ne…
      name    = ""     # string | optional | Optional. Use VM image name to find the image.
      project = ""     # string | optional | The name of the Google Cloud project that this VM image belo…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

