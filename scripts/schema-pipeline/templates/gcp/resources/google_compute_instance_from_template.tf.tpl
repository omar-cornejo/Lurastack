# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_from_template               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_from_template" "this" {

  name                      = ""     # string | required | The name of the instance. One of name or self_link must be p…
  source_instance_template  = ""     # string | required | Name or self link of an instance template to create the inst…
  allow_stopping_for_update = false  # bool | optional+computed | If true, allows Terraform to stop the instance to update its…
  attached_disk             = []     # list(object({ device_name: string, disk_encryption_key_raw: string, disk_encryption_key_sha256: string, kms_key_self_link: string, mode: string, source: string })) | optional+computed | List of disks attached to the instance
  can_ip_forward            = false  # bool | optional+computed | Whether sending and receiving of packets with non-matching s…
  deletion_protection       = false  # bool | optional+computed | Whether deletion protection is enabled on this instance.
  description               = ""     # string | optional+computed | A brief description of the resource.
  desired_status            = ""     # string | optional+computed | Desired status of the instance. Either "RUNNING" or "TERMINA…
  enable_display            = false  # bool | optional+computed | Whether the instance has virtual displays enabled.
  guest_accelerator         = []     # list(object({ count: number, type: string })) | optional+computed | List of the type and count of accelerator cards attached to …
  hostname                  = ""     # string | optional+computed | A custom hostname for the instance. Must be a fully qualifie…
  id                        = ""     # string | optional+computed
  labels                    = {}     # map(string) | optional+computed | A set of key/value label pairs assigned to the instance.  		…
  machine_type              = ""     # string | optional+computed | The machine type to create.
  metadata                  = {}     # map(string) | optional+computed | Metadata key/value pairs made available within the instance.
  metadata_startup_script   = ""     # string | optional+computed | Metadata startup scripts made available within the instance.
  min_cpu_platform          = ""     # string | optional+computed | The minimum CPU platform specified for the VM instance.
  project                   = ""     # string | optional+computed | The ID of the project in which the resource belongs. If self…
  resource_policies         = []     # list(string) | optional+computed | A list of self_links of resource policies to attach to the i…
  scratch_disk              = []     # list(object({ device_name: string, interface: string, size: number })) | optional+computed | The scratch disks attached to the instance.
  service_account           = []     # list(object({ email: string, scopes: set(string) })) | optional+computed | The service account to attach to the instance.
  tags                      = []     # set(string) | optional+computed | The list of tags attached to the instance.
  zone                      = ""     # string | optional+computed | The zone of the instance. If self_link is provided, this val…

  # cpu_platform              = ""     # string | computed | The CPU platform used by this instance.
  # current_status            = ""     # string | computed |  					Current status of the instance. 					This could be one…
  # effective_labels          = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # instance_id               = ""     # string | computed | The server-assigned unique identifier of this instance.
  # label_fingerprint         = ""     # string | computed | The unique fingerprint of the labels.
  # metadata_fingerprint      = ""     # string | computed | The unique fingerprint of the metadata.
  # self_link                 = ""     # string | computed | The URI of the created resource.
  # tags_fingerprint          = ""     # string | computed | The unique fingerprint of the tags.
  # terraform_labels          = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  advanced_machine_features { # list [0..1]
    enable_nested_virtualization = false  # bool | optional+computed | Whether to enable nested virtualization or not.
    threads_per_core             = 0      # number | optional+computed | The number of threads per physical core. To disable simultan…
    visible_core_count           = 0      # number | optional+computed | The number of physical cores to expose to an instance. Multi…

  }

  boot_disk { # list [0..1]
    auto_delete                = false  # bool | optional+computed | Whether the disk will be auto-deleted when the instance is d…
    device_name                = ""     # string | optional+computed | Name with which attached disk will be accessible under /dev/…
    disk_encryption_key_raw    = ""     # string | optional+computed+sensitive | A 256-bit customer-supplied encryption key, encoded in RFC 4…
    kms_key_self_link          = ""     # string | optional+computed | The self_link of the encryption key that is stored in Google…
    mode                       = ""     # string | optional+computed | Read/write mode for the disk. One of "READ_ONLY" or "READ_WR…
    source                     = ""     # string | optional+computed | The name or self_link of the disk attached to this instance.

    # disk_encryption_key_sha256 = ""     # string | computed | The RFC 4648 base64 encoded SHA-256 hash of the customer-sup…

    initialize_params { # list [0..1]
      enable_confidential_compute = false  # bool | optional+computed | A flag to enable confidential compute mode on boot disk
      image                       = ""     # string | optional+computed | The image from which this disk was initialised.
      labels                      = {}     # map(string) | optional+computed | A set of key/value label pairs assigned to the disk.
      provisioned_iops            = 0      # number | optional+computed | Indicates how many IOPS to provision for the disk. This sets…
      provisioned_throughput      = 0      # number | optional+computed | Indicates how much throughput to provision for the disk. Thi…
      resource_manager_tags       = {}     # map(string) | optional+computed | A map of resource manager tags. Resource manager tag keys an…
      size                        = 0      # number | optional+computed | The size of the image in gigabytes.
      storage_pool                = ""     # string | optional+computed | The URL of the storage pool in which the new disk is created
      type                        = ""     # string | optional+computed | The Google Compute Engine disk type. Such as pd-standard, pd…

    }

  }

  confidential_instance_config { # list [0..1]
    confidential_instance_type  = ""     # string | optional+computed |  								The confidential computing technology the instance …
    enable_confidential_compute = false  # bool | optional+computed | Defines whether the instance should have confidential comput…

  }

  network_interface { # list
    access_config               = []     # list(object({ nat_ip: string, network_tier: string, public_ptr_domain_name: string })) | optional+computed | Access configurations, i.e. IPs via which this instance can …
    alias_ip_range              = []     # list(object({ ip_cidr_range: string, subnetwork_range_name: string })) | optional+computed | An array of alias IP ranges for this network interface.
    internal_ipv6_prefix_length = 0      # number | optional+computed | The prefix length of the primary internal IPv6 range.
    ipv6_address                = ""     # string | optional+computed | An IPv6 internal network address for this network interface.…
    network                     = ""     # string | optional+computed | The name or self_link of the network attached to this interf…
    network_ip                  = ""     # string | optional+computed | The private IP address assigned to the instance.
    nic_type                    = ""     # string | optional+computed | The type of vNIC to be used on this interface. Possible valu…
    queue_count                 = 0      # number | optional+computed | The networking queue count that's specified by users for the…
    stack_type                  = ""     # string | optional+computed | The stack type for this network interface to identify whethe…
    subnetwork                  = ""     # string | optional+computed | The name or self_link of the subnetwork attached to this int…
    subnetwork_project          = ""     # string | optional+computed | The project in which the subnetwork belongs.

    # ipv6_access_type            = ""     # string | computed | One of EXTERNAL, INTERNAL to indicate whether the IP can be …
    # name                        = ""     # string | computed | The name of the interface

    ipv6_access_config { # list
      network_tier                = ""     # string | required | The service-level to be provided for IPv6 traffic when the s…
      external_ipv6               = ""     # string | optional+computed | The first IPv6 address of the external IPv6 range associated…
      external_ipv6_prefix_length = ""     # string | optional+computed | The prefix length of the external IPv6 range.
      name                        = ""     # string | optional+computed | The name of this access configuration. In ipv6AccessConfigs,…
      public_ptr_domain_name      = ""     # string | optional+computed | The domain name to be used when creating DNSv6 records for t…

    }

  }

  network_performance_config { # list [0..1]
    total_egress_bandwidth_tier = ""     # string | required | The egress bandwidth tier to enable. Possible values:TIER_1,…

  }

  params { # list [0..1]
    resource_manager_tags = {}     # map(string) | optional+computed | A map of resource manager tags. Resource manager tag keys an…

  }

  reservation_affinity { # list [0..1]
    type = ""     # string | required | The type of reservation from which this instance can consume…

    specific_reservation { # list [0..1]
      key    = ""     # string | required | Corresponds to the label key of a reservation resource. To t…
      values = []     # list(string) | required | Corresponds to the label values of a reservation resource.

    }

  }

  scheduling { # list [0..1]
    automatic_restart           = false  # bool | optional+computed | Specifies if the instance should be restarted if it was term…
    instance_termination_action = ""     # string | optional+computed | Specifies the action GCE should take when SPOT VM is preempt…
    min_node_cpus               = 0      # number | optional+computed
    on_host_maintenance         = ""     # string | optional+computed | Describes maintenance behavior for the instance. One of MIGR…
    preemptible                 = false  # bool | optional+computed | Whether the instance is preemptible.
    provisioning_model          = ""     # string | optional+computed | Whether the instance is spot. If this is set as SPOT.

    local_ssd_recovery_timeout { # list [0..1]
      seconds = 0      # number | required | Span of time at a resolution of a second. Must be from 0 to …
      nanos   = 0      # number | optional+computed | Span of time that's a fraction of a second at nanosecond res…

    }

    max_run_duration { # list [0..1]
      seconds = 0      # number | required | Span of time at a resolution of a second. Must be from 0 to …
      nanos   = 0      # number | optional+computed | Span of time that's a fraction of a second at nanosecond res…

    }

    node_affinities { # set
      key      = ""     # string | required
      operator = ""     # string | required
      values   = []     # set(string) | required

    }

    on_instance_stop_action { # list [0..1]
      discard_local_ssd = false  # bool | optional+computed | If true, the contents of any attached Local SSD disks will b…

    }

  }

  shielded_instance_config { # list [0..1]
    enable_integrity_monitoring = false  # bool | optional+computed | Whether integrity monitoring is enabled for the instance.
    enable_secure_boot          = false  # bool | optional+computed | Whether secure boot is enabled for the instance.
    enable_vtpm                 = false  # bool | optional+computed | Whether the instance uses vTPM.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

