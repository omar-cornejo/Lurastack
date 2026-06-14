# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_index                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_index" "this" {

  display_name        = ""     # string | required | The display name of the Index. The name can be up to 128 cha…
  description         = ""     # string | optional | The description of the Index.
  id                  = ""     # string | optional+computed
  index_update_method = ""     # string | optional | The update method to use with this Index. The value must be …
  labels              = {}     # map(string) | optional | The labels with user-defined metadata to organize your Index…
  project             = ""     # string | optional+computed
  region              = ""     # string | optional | The region of the index. eg us-central1

  # create_time         = ""     # string | computed | The timestamp of when the Index was created in RFC3339 UTC "…
  # deployed_indexes = [  # list(object)
  #   {
  #     deployed_index_id = ""
  #     index_endpoint = ""
  #   }
  # ]
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # index_stats = [  # list(object)
  #   {
  #     shards_count = 0
  #     vectors_count = ""
  #   }
  # ]
  # metadata_schema_uri = ""     # string | computed | Points to a YAML file stored on Google Cloud Storage describ…
  # name                = ""     # string | computed | The resource name of the Index.
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | The timestamp of when the Index was last updated in RFC3339 …

  metadata { # list [0..1]
    contents_delta_uri    = ""     # string | required | Allows inserting, updating  or deleting the contents of the …
    is_complete_overwrite = false  # bool | optional | If this field is set together with contentsDeltaUri when cal…

    config { # list [0..1]
      dimensions                  = 0      # number | required | The number of dimensions of the input vectors.
      approximate_neighbors_count = 0      # number | optional | The default number of neighbors to find via approximate sear…
      distance_measure_type       = ""     # string | optional | The distance measure used in nearest neighbor search. The va…
      feature_norm_type           = ""     # string | optional | Type of normalization to be carried out on each vector. The …
      shard_size                  = ""     # string | optional+computed | Index data is split into equal parts to be processed. These …

      algorithm_config { # list [0..1]

        brute_force_config {} # list [0..1]

        tree_ah_config { # list [0..1]
          leaf_node_embedding_count    = 0      # number | optional | Number of embeddings on each leaf node. The default value is…
          leaf_nodes_to_search_percent = 0      # number | optional | The default percentage of leaf nodes that any query may be s…

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

