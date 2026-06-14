# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_aws_node_pool                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_aws_node_pool" "this" {

  cluster               = ""     # string | required | The awsCluster for the resource
  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | The name of this resource.
  subnet_id             = ""     # string | required | The subnet where the node pool node run.
  version               = ""     # string | required | The Kubernetes version to run on this node pool (e.g. `1.19.…
  annotations           = {}     # map(string) | optional | Optional. Annotations on the node pool. This field has the s…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed | The project for the resource

  # create_time           = ""     # string | computed | Output only. The time at which this node pool was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # etag                  = ""     # string | computed | Allows clients to perform consistent read-modify-writes thro…
  # reconciling           = false  # bool | computed | Output only. If set, there are currently changes in flight t…
  # state                 = ""     # string | computed | Output only. The lifecycle state of the node pool. Possible …
  # uid                   = ""     # string | computed | Output only. A globally unique identifier for the node pool.
  # update_time           = ""     # string | computed | Output only. The time at which this node pool was last updat…

  autoscaling { # list [1..1]
    max_node_count = 0      # number | required | Maximum number of nodes in the NodePool. Must be >= min_node…
    min_node_count = 0      # number | required | Minimum number of nodes in the NodePool. Must be >= 1 and <=…

  }

  config { # list [1..1]
    iam_instance_profile = ""     # string | required | The name of the AWS IAM role assigned to nodes in the pool.
    instance_type        = ""     # string | optional+computed | Optional. The AWS instance type. When unspecified, it defaul…
    labels               = {}     # map(string) | optional | Optional. The initial labels assigned to nodes of this node …
    security_group_ids   = []     # list(string) | optional | Optional. The IDs of additional security groups to add to no…
    tags                 = {}     # map(string) | optional | Optional. Key/value metadata to assign to each underlying AW…

    autoscaling_metrics_collection { # list [0..1]
      granularity = ""     # string | required | The frequency at which EC2 Auto Scaling sends aggregated dat…
      metrics     = []     # list(string) | optional | The metrics to enable. For a list of valid metrics, see http…

    }

    config_encryption { # list [1..1]
      kms_key_arn = ""     # string | required | The ARN of the AWS KMS key used to encrypt node pool configu…

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

    taints { # list
      effect = ""     # string | required | The taint effect. Possible values: EFFECT_UNSPECIFIED, NO_SC…
      key    = ""     # string | required | Key for the taint.
      value  = ""     # string | required | Value for the taint.

    }

  }

  management { # list [0..1]
    auto_repair = false  # bool | optional+computed | Optional. Whether or not the nodes will be automatically rep…

  }

  max_pods_constraint { # list [1..1]
    max_pods_per_node = 0      # number | required | The maximum number of pods to schedule on a single node.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  update_settings { # list [0..1]

    surge_settings { # list [0..1]
      max_surge       = 0      # number | optional+computed | Optional. The maximum number of nodes that can be created be…
      max_unavailable = 0      # number | optional+computed | Optional. The maximum number of nodes that can be simultaneo…

    }

  }

}

