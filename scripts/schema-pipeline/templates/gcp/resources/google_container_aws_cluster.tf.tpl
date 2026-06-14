# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_aws_cluster                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_aws_cluster" "this" {

  aws_region               = ""     # string | required | The AWS region where the cluster runs. Each Google Cloud reg…
  location                 = ""     # string | required | The location for the resource
  name                     = ""     # string | required | The name of this resource.
  annotations              = {}     # map(string) | optional | Optional. Annotations on the cluster. This field has the sam…
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

  binary_authorization { # list [0..1]
    evaluation_mode = ""     # string | optional+computed | Mode of operation for Binary Authorization policy evaluation…

  }

  control_plane { # list [1..1]
    iam_instance_profile = ""     # string | required | The name of the AWS IAM instance pofile to assign to each co…
    subnet_ids           = []     # list(string) | required | The list of subnets where control plane replicas will run. A…
    version              = ""     # string | required | The Kubernetes version to run on control plane replicas (e.g…
    instance_type        = ""     # string | optional+computed | Optional. The AWS instance type. When unspecified, it defaul…
    security_group_ids   = []     # list(string) | optional | Optional. The IDs of additional security groups to add to co…
    tags                 = {}     # map(string) | optional | Optional. A set of AWS resource tags to propagate to all und…

    aws_services_authentication { # list [1..1]
      role_arn          = ""     # string | required | The Amazon Resource Name (ARN) of the role that the Anthos M…
      role_session_name = ""     # string | optional+computed | Optional. An identifier for the assumed role session. When u…

    }

    config_encryption { # list [1..1]
      kms_key_arn = ""     # string | required | The ARN of the AWS KMS key used to encrypt cluster configura…

    }

    database_encryption { # list [1..1]
      kms_key_arn = ""     # string | required | The ARN of the AWS KMS key used to encrypt cluster secrets.

    }

    main_volume { # list [0..1]
      iops        = 0      # number | optional+computed | Optional. The number of I/O operations per second (IOPS) to …
      kms_key_arn = ""     # string | optional | Optional. The Amazon Resource Name (ARN) of the Customer Man…
      size_gib    = 0      # number | optional+computed | Optional. The size of the volume, in GiBs. When unspecified,…
      throughput  = 0      # number | optional+computed | Optional. The throughput to provision for the volume, in MiB…
      volume_type = ""     # string | optional+computed | Optional. Type of the EBS volume. When unspecified, it defau…

    }

    proxy_config { # list [0..1]
      secret_arn     = ""     # string | required | The ARN of the AWS Secret Manager secret that contains the H…
      secret_version = ""     # string | required | The version string of the AWS Secret Manager secret that con…

    }

    root_volume { # list [0..1]
      iops        = 0      # number | optional+computed | Optional. The number of I/O operations per second (IOPS) to …
      kms_key_arn = ""     # string | optional | Optional. The Amazon Resource Name (ARN) of the Customer Man…
      size_gib    = 0      # number | optional+computed | Optional. The size of the volume, in GiBs. When unspecified,…
      throughput  = 0      # number | optional+computed | Optional. The throughput to provision for the volume, in MiB…
      volume_type = ""     # string | optional+computed | Optional. Type of the EBS volume. When unspecified, it defau…

    }

    ssh_config { # list [0..1]
      ec2_key_pair = ""     # string | required | The name of the EC2 key pair used to login into cluster mach…

    }

  }

  fleet { # list [1..1]
    project    = ""     # string | optional+computed | The number of the Fleet host project where this cluster will…

    # membership = ""     # string | computed | The name of the managed Hub Membership resource associated t…

  }

  networking { # list [1..1]
    pod_address_cidr_blocks         = []     # list(string) | required | All pods in the cluster are assigned an RFC1918 IPv4 address…
    service_address_cidr_blocks     = []     # list(string) | required | All services in the cluster are assigned an RFC1918 IPv4 add…
    vpc_id                          = ""     # string | required | The VPC associated with the cluster. All component clusters …
    per_node_pool_sg_rules_disabled = false  # bool | optional | Disable the per node pool subnet security group rules on the…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

