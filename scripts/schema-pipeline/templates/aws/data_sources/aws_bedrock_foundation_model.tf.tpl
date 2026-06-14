# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrock_foundation_model                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrock_foundation_model" "this" {

  model_id                     = ""     # string | required

  # customizations_supported     = []     # set(string) | computed
  # id                           = ""     # string | computed
  # inference_types_supported    = []     # set(string) | computed
  # input_modalities             = []     # set(string) | computed
  # model_arn                    = ""     # string | computed
  # model_name                   = ""     # string | computed
  # output_modalities            = []     # set(string) | computed
  # provider_name                = ""     # string | computed
  # response_streaming_supported = false  # bool | computed

}

