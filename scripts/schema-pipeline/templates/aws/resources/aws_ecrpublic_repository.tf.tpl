# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecrpublic_repository                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecrpublic_repository" "this" {

  repository_name = ""     # string | required
  force_destroy   = false  # bool | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # registry_id     = ""     # string | computed
  # repository_uri  = ""     # string | computed

  catalog_data { # list [0..1]
    about_text        = ""     # string | optional
    architectures     = []     # set(string) | optional
    description       = ""     # string | optional
    logo_image_blob   = ""     # string | optional+computed
    operating_systems = []     # set(string) | optional
    usage_text        = ""     # string | optional

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

