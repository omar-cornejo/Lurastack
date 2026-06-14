# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrock_inference_profile                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrock_inference_profile" "this" {

  inference_profile_id   = ""     # string | required

  # created_at             = ""     # string | computed
  # description            = ""     # string | computed
  # inference_profile_arn  = ""     # string | computed
  # inference_profile_name = ""     # string | computed
  # models = [  # list(object)
  #   {
  #     model_arn = ""
  #   }
  # ]
  # status                 = ""     # string | computed
  # type                   = ""     # string | computed
  # updated_at             = ""     # string | computed

}

