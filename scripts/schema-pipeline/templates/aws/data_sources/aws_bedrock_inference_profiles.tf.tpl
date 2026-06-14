# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrock_inference_profiles                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrock_inference_profiles" "this" {


  # inference_profile_summaries = [  # list(object)
  #   {
  #     created_at = ""
  #     description = ""
  #     inference_profile_arn = ""
  #     inference_profile_id = ""
  #     inference_profile_name = ""
  #     models = [  # list(object)
  #       {
  #         model_arn = ""
  #       }
  #     ]
  #     status = ""
  #     type = ""
  #     updated_at = ""
  #   }
  # ]

}

