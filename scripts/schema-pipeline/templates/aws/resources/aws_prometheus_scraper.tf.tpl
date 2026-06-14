# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_prometheus_scraper                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_prometheus_scraper" "this" {

  scrape_configuration = ""     # string | required
  alias                = ""     # string | optional
  tags                 = {}     # map(string) | optional

  # arn                  = ""     # string | computed
  # id                   = ""     # string | computed
  # role_arn             = ""     # string | computed
  # tags_all             = {}     # map(string) | computed

  destination { # list

    amp { # list
      workspace_arn = ""     # string | required

    }

  }

  role_configuration { # list
    source_role_arn = ""     # string | optional
    target_role_arn = ""     # string | optional

  }

  source { # list

    eks { # list
      cluster_arn        = ""     # string | required
      subnet_ids         = []     # set(string) | required
      security_group_ids = []     # set(string) | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

