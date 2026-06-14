# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastic_beanstalk_configuration_template        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastic_beanstalk_configuration_template" "this" {

  application         = ""     # string | required
  name                = ""     # string | required
  description         = ""     # string | optional
  environment_id      = ""     # string | optional
  id                  = ""     # string | optional+computed
  solution_stack_name = ""     # string | optional

  setting { # set
    name      = ""     # string | required
    namespace = ""     # string | required
    value     = ""     # string | required
    resource  = ""     # string | optional

  }

}

