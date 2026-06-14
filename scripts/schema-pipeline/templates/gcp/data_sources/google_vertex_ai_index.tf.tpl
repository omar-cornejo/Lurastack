# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vertex_ai_index                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_vertex_ai_index" "this" {

  name                = ""     # string | required | The resource name of the Index.
  region              = ""     # string | required | The region of the index. eg us-central1
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional

  # create_time         = ""     # string | computed | The timestamp of when the Index was created in RFC3339 UTC "…
  # deployed_indexes = [  # list(object)
  #   {
  #     deployed_index_id = ""
  #     index_endpoint = ""
  #   }
  # ]
  # description         = ""     # string | computed | The description of the Index.
  # display_name        = ""     # string | computed | The display name of the Index. The name can be up to 128 cha…
  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # index_stats = [  # list(object)
  #   {
  #     shards_count = 0
  #     vectors_count = ""
  #   }
  # ]
  # index_update_method = ""     # string | computed | The update method to use with this Index. The value must be …
  # labels              = {}     # map(string) | computed | The labels with user-defined metadata to organize your Index…
  # metadata = [  # list(object)
  #   {
  #     config = [  # list(object)
  #       {
  #         algorithm_config = [  # list(object)
  #           {
  #             brute_force_config = [  # list(object)
  #               {
  #               }
  #             ]
  #             tree_ah_config = [  # list(object)
  #               {
  #                 leaf_node_embedding_count = 0
  #                 leaf_nodes_to_search_percent = 0
  #               }
  #             ]
  #           }
  #         ]
  #         approximate_neighbors_count = 0
  #         dimensions = 0
  #         distance_measure_type = ""
  #         feature_norm_type = ""
  #         shard_size = ""
  #       }
  #     ]
  #     contents_delta_uri = ""
  #     is_complete_overwrite = false
  #   }
  # ]
  # metadata_schema_uri = ""     # string | computed | Points to a YAML file stored on Google Cloud Storage describ…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time         = ""     # string | computed | The timestamp of when the Index was last updated in RFC3339 …

}

