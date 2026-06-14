# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_collection                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_collection" "this" {

  id                  = ""     # string | optional+computed | ID of the collection.
  name                = ""     # string | optional+computed | Name of the collection.

  # arn                 = ""     # string | computed
  # collection_endpoint = ""     # string | computed | Collection-specific endpoint used to submit index, search, a…
  # created_date        = ""     # string | computed | Date the Collection was created.
  # dashboard_endpoint  = ""     # string | computed | Collection-specific endpoint used to access OpenSearch Dashb…
  # description         = ""     # string | computed | Description of the collection.
  # failure_code        = ""     # string | computed | A failure code associated with the collection.
  # failure_message     = ""     # string | computed | A failure reason associated with the collection.
  # kms_key_arn         = ""     # string | computed | The ARN of the Amazon Web Services KMS key used to encrypt t…
  # last_modified_date  = ""     # string | computed | Date the Collection was last modified.
  # standby_replicas    = ""     # string | computed | Indicates whether standby replicas should be used for a coll…
  # tags                = {}     # map(string) | computed
  # type                = ""     # string | computed | Type of collection.

}

