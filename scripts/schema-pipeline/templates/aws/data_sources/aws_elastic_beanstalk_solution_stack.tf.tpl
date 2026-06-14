# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elastic_beanstalk_solution_stack                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_elastic_beanstalk_solution_stack" "this" {

  name_regex  = ""     # string | required
  id          = ""     # string | optional+computed
  most_recent = false  # bool | optional

  # name        = ""     # string | computed

}

