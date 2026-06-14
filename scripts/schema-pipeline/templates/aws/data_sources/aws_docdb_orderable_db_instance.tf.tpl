# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_docdb_orderable_db_instance                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_docdb_orderable_db_instance" "this" {

  engine                     = ""     # string | optional
  engine_version             = ""     # string | optional+computed
  id                         = ""     # string | optional+computed
  instance_class             = ""     # string | optional+computed
  license_model              = ""     # string | optional
  preferred_instance_classes = []     # list(string) | optional
  vpc                        = false  # bool | optional+computed

  # availability_zones         = []     # list(string) | computed

}

