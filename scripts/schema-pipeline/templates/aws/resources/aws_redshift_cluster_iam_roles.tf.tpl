# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_cluster_iam_roles                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_cluster_iam_roles" "this" {

  cluster_identifier   = ""     # string | required
  default_iam_role_arn = ""     # string | optional+computed
  iam_role_arns        = []     # set(string) | optional+computed
  id                   = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

