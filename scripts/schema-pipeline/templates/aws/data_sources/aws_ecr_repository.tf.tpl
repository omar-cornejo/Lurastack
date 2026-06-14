# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_repository                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_repository" "this" {

  name                         = ""     # string | required
  id                           = ""     # string | optional+computed
  registry_id                  = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # encryption_configuration = [  # list(object)
  #   {
  #     encryption_type = ""
  #     kms_key = ""
  #   }
  # ]
  # image_scanning_configuration = [  # list(object)
  #   {
  #     scan_on_push = false
  #   }
  # ]
  # image_tag_mutability         = ""     # string | computed
  # most_recent_image_tags       = []     # list(string) | computed
  # repository_url               = ""     # string | computed

}

