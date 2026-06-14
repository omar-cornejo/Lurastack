# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_replicator                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_replicator" "this" {

  replicator_name            = ""     # string | required
  service_execution_role_arn = ""     # string | required
  description                = ""     # string | optional
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # current_version            = ""     # string | computed

  kafka_cluster { # list [2..2]

    amazon_msk_cluster { # list [1..1]
      msk_cluster_arn = ""     # string | required

    }

    vpc_config { # list [1..1]
      subnet_ids          = []     # set(string) | required
      security_groups_ids = []     # set(string) | optional

    }

  }

  replication_info_list { # list [1..1]
    source_kafka_cluster_arn   = ""     # string | required
    target_compression_type    = ""     # string | required
    target_kafka_cluster_arn   = ""     # string | required

    # source_kafka_cluster_alias = ""     # string | computed
    # target_kafka_cluster_alias = ""     # string | computed

    consumer_group_replication { # list [1..*]
      consumer_groups_to_replicate        = []     # set(string) | required
      consumer_groups_to_exclude          = []     # set(string) | optional
      detect_and_copy_new_consumer_groups = false  # bool | optional
      synchronise_consumer_group_offsets  = false  # bool | optional

    }

    topic_replication { # list [1..*]
      topics_to_replicate                  = []     # set(string) | required
      copy_access_control_lists_for_topics = false  # bool | optional
      copy_topic_configurations            = false  # bool | optional
      detect_and_copy_new_topics           = false  # bool | optional
      topics_to_exclude                    = []     # set(string) | optional

      starting_position { # list [0..1]
        type = ""     # string | optional

      }

      topic_name_configuration { # list [0..1]
        type = ""     # string | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

