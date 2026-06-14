# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrock_foundation_models                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrock_foundation_models" "this" {

  by_customization_type = ""     # string | optional
  by_inference_type     = ""     # string | optional
  by_output_modality    = ""     # string | optional
  by_provider           = ""     # string | optional

  # id                    = ""     # string | computed
  # model_summaries = [  # list(object)
  #   {
  #     customizations_supported = []  # set(string)
  #     inference_types_supported = []  # set(string)
  #     input_modalities = []  # set(string)
  #     model_arn = ""
  #     model_id = ""
  #     model_name = ""
  #     output_modalities = []  # set(string)
  #     provider_name = ""
  #     response_streaming_supported = false
  #   }
  # ]

}

