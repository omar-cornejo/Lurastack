# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance" "this" {

  machine_type              = ""     # string | required | The machine type to create.
  name                      = ""     # string | required | The name of the instance. One of name or self_link must be p…
  allow_stopping_for_update = false  # bool | optional | If true, allows Terraform to stop the instance to update its…
  can_ip_forward            = false  # bool | optional | Whether sending and receiving of packets with non-matching s…
  deletion_protection       = false  # bool | optional | Whether deletion protection is enabled on this instance.
  description               = ""     # string | optional | A brief description of the resource.
  desired_status            = ""     # string | optional | Desired status of the instance. Either "RUNNING" or "TERMINA…
  enable_display            = false  # bool | optional | Whether the instance has virtual displays enabled.
  guest_accelerator         = []     # list(object({ count: number, type: string })) | optional+computed | List of the type and count of accelerator cards attached to …
  hostname                  = ""     # string | optional | A custom hostname for the instance. Must be a fully qualifie…
  id                        = ""     # string | optional+computed
  labels                    = {}     # map(string) | optional | A set of key/value label pairs assigned to the instance.  		…
  metadata                  = {}     # map(string) | optional | Metadata key/value pairs made available within the instance.
  metadata_startup_script   = ""     # string | optional | Metadata startup scripts made available within the instance.
  min_cpu_platform          = ""     # string | optional+computed | The minimum CPU platform specified for the VM instance.
  project                   = ""     # string | optional+computed | The ID of the project in which the resource belongs. If self…
  resource_policies         = []     # list(string) | optional | A list of self_links of resource policies to attach to the i…
  tags                      = []     # set(string) | optional | The list of tags attached to the instance.
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
    enable_nested_virtualization = false  # bool | optional | Whether to enable nested virtualization or not.
    threads_per_core             = 0      # number | optional | The number of threads per physical core. To disable simultan…
    visible_core_count           = 0      # number | optional | The number of physical cores to expose to an instance. Multi…

  }

  attached_disk { # list
    source                     = ""     # string | required | The name or self_link of the disk attached to this instance.
    device_name                = ""     # string | optional+computed | Name with which the attached disk is accessible under /dev/d…
    disk_encryption_key_raw    = ""     # string | optional+sensitive | A 256-bit customer-supplied encryption key, encoded in RFC 4…
    kms_key_self_link          = ""     # string | optional+computed | The self_link of the encryption key that is stored in Google…
    mode                       = ""     # string | optional | Read/write mode for the disk. One of "READ_ONLY" or "READ_WR…

    # disk_encryption_key_sha256 = ""     # string | computed | The RFC 4648 base64 encoded SHA-256 hash of the customer-sup…

  }

  boot_disk { # list [1..1]
    auto_delete                = false  # bool | optional | Whether the disk will be auto-deleted when the instance is d…
    device_name                = ""     # string | optional+computed | Name with which attached disk will be accessible under /dev/…
    disk_encryption_key_raw    = ""     # string | optional+sensitive | A 256-bit customer-supplied encryption key, encoded in RFC 4…
    kms_key_self_link          = ""     # string | optional+computed | The self_link of the encryption key that is stored in Google…
    mode                       = ""     # string | optional | Read/write mode for the disk. One of "READ_ONLY" or "READ_WR…
    source                     = ""     # string | optional+computed | The name or self_link of the disk attached to this instance.

    # disk_encryption_key_sha256 = ""     # string | computed | The RFC 4648 base64 encoded SHA-256 hash of the customer-sup…

    initialize_params { # list [0..1]
      enable_confidential_compute = false  # bool | optional | A flag to enable confidential compute mode on boot disk
      image                       = ""     # string | optional+computed | The image from which this disk was initialised.
      labels                      = {}     # map(string) | optional+computed | A set of key/value label pairs assigned to the disk.
      provisioned_iops            = 0      # number | optional+computed | Indicates how many IOPS to provision for the disk. This sets…
      provisioned_throughput      = 0      # number | optional+computed | Indicates how much throughput to provision for the disk. Thi…
      resource_manager_tags       = {}     # map(string) | optional | A map of resource manager tags. Resource manager tag keys an…
      size                        = 0      # number | optional+computed | The size of the image in gigabytes.
      storage_pool                = ""     # string | optional | The URL of the storage pool in which the new disk is created
      type                        = ""     # string | optional+computed | The Google Compute Engine disk type. Such as pd-standard, pd…

    }

  }

  confidential_instance_config { # list [0..1]
    confidential_instance_type  = ""     # string | optional |  								The confidential computing technology the instance …
    enable_confidential_compute = false  # bool | optional | Defines whether the instance should have confidential comput…

  }

  network_interface { # list [1..*]
    internal_ipv6_prefix_length = 0      # number | optional+computed | The prefix length of the primary internal IPv6 range.
    ipv6_address                = ""     # string | optional+computed | An IPv6 internal network address for this network interface.…
    network                     = ""     # string | optional+computed | The name or self_link of the network attached to this interf…
    network_ip                  = ""     # string | optional+computed | The private IP address assigned to the instance.
    nic_type                    = ""     # string | optional | The type of vNIC to be used on this interface. Possible valu…
    queue_count                 = 0      # number | optional | The networking queue count that's specified by users for the…
    stack_type                  = ""     # string | optional+computed | The stack type for this network interface to identify whethe…
    subnetwork                  = ""     # string | optional+computed | The name or self_link of the subnetwork attached to this int…
    subnetwork_project          = ""     # string | optional+computed | The project in which the subnetwork belongs.

    # ipv6_access_type            = ""     # string | computed | One of EXTERNAL, INTERNAL to indicate whether the IP can be …
    # name                        = ""     # string | computed | The name of the interface

    access_config { # list
      nat_ip                 = ""     # string | optional+computed | The IP address that is be 1:1 mapped to the instance's netwo…
      network_tier           = ""     # string | optional+computed | The networking tier used for configuring this instance. One …
      public_ptr_domain_name = ""     # string | optional | The DNS domain name for the public PTR record.

    }

    alias_ip_range { # list
      ip_cidr_range         = ""     # string | required | The IP CIDR range represented by this alias IP range.
      subnetwork_range_name = ""     # string | optional | The subnetwork secondary range name specifying the secondary…

    }

    ipv6_access_config { # list
      network_tier                = ""     # string | required | The service-level to be provided for IPv6 traffic when the s…
      external_ipv6               = ""     # string | optional+computed | The first IPv6 address of the external IPv6 range associated…
      external_ipv6_prefix_length = ""     # string | optional+computed | The prefix length of the external IPv6 range.
      name                        = ""     # string | optional+computed | The name of this access configuration. In ipv6AccessConfigs,…
      public_ptr_domain_name      = ""     # string | optional | The domain name to be used when creating DNSv6 records for t…

    }

  }

  network_performance_config { # list [0..1]
    total_egress_bandwidth_tier = ""     # string | required | The egress bandwidth tier to enable. Possible values:TIER_1,…

  }

  params { # list [0..1]
    resource_manager_tags = {}     # map(string) | optional | A map of resource manager tags. Resource manager tag keys an…

  }

  reservation_affinity { # list [0..1]
    type = ""     # string | required | The type of reservation from which this instance can consume…

    specific_reservation { # list [0..1]
      key    = ""     # string | required | Corresponds to the label key of a reservation resource. To t…
      values = []     # list(string) | required | Corresponds to the label values of a reservation resource.

    }

  }

  scheduling { # list [0..1]
    automatic_restart           = false  # bool | optional | Specifies if the instance should be restarted if it was term…
    instance_termination_action = ""     # string | optional | Specifies the action GCE should take when SPOT VM is preempt…
    min_node_cpus               = 0      # number | optional
    on_host_maintenance         = ""     # string | optional+computed | Describes maintenance behavior for the instance. One of MIGR…
    preemptible                 = false  # bool | optional | Whether the instance is preemptible.
    provisioning_model          = ""     # string | optional+computed | Whether the instance is spot. If this is set as SPOT.

    local_ssd_recovery_timeout { # list [0..1]
      seconds = 0      # number | required | Span of time at a resolution of a second. Must be from 0 to …
      nanos   = 0      # number | optional | Span of time that's a fraction of a second at nanosecond res…

    }

    max_run_duration { # list [0..1]
      seconds = 0      # number | required | Span of time at a resolution of a second. Must be from 0 to …
      nanos   = 0      # number | optional | Span of time that's a fraction of a second at nanosecond res…

    }

    node_affinities { # set
      key      = ""     # string | required
      operator = ""     # string | required
      values   = []     # set(string) | required

    }

    on_instance_stop_action { # list [0..1]
      discard_local_ssd = false  # bool | optional | If true, the contents of any attached Local SSD disks will b…

    }

  }

  scratch_disk { # list
    interface   = ""     # string | required | The disk interface used for attaching this disk. One of SCSI…
    device_name = ""     # string | optional+computed | Name with which the attached disk is accessible under /dev/d…
    size        = 0      # number | optional | The size of the disk in gigabytes. One of 375 or 3000.

  }

  service_account { # list [0..1]
    scopes = []     # set(string) | required | A list of service scopes.
    email  = ""     # string | optional+computed | The service account e-mail address.

  }

  shielded_instance_config { # list [0..1]
    enable_integrity_monitoring = false  # bool | optional | Whether integrity monitoring is enabled for the instance.
    enable_secure_boot          = false  # bool | optional | Whether secure boot is enabled for the instance.
    enable_vtpm                 = false  # bool | optional | Whether the instance uses vTPM.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

