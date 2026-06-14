# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53domains_domain                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53domains_domain" "this" {

  domain_name         = ""     # string | required
  admin_privacy       = false  # bool | optional+computed
  auto_renew          = false  # bool | optional+computed
  billing_contact     = []     # list(object({ address_line_1: string, address_line_2: string, city: string, contact_type: string, country_code: string, email: string, extra_param: list(object({ name: string, value: string })), fax: string, first_name: string, last_name: string, organization_name: string, phone_number: string, state: string, zip_code: string })) | optional+computed
  billing_privacy     = false  # bool | optional+computed
  duration_in_years   = 0      # number | optional+computed
  name_server         = []     # list(object({ glue_ips: set(string), name: string })) | optional+computed
  registrant_privacy  = false  # bool | optional+computed
  tags                = {}     # map(string) | optional
  tech_privacy        = false  # bool | optional+computed
  transfer_lock       = false  # bool | optional+computed

  # abuse_contact_email = ""     # string | computed
  # abuse_contact_phone = ""     # string | computed
  # creation_date       = ""     # string | computed
  # expiration_date     = ""     # string | computed
  # hosted_zone_id      = ""     # string | computed
  # registrar_name      = ""     # string | computed
  # registrar_url       = ""     # string | computed
  # status_list         = []     # list(string) | computed
  # tags_all            = {}     # map(string) | computed
  # updated_date        = ""     # string | computed
  # whois_server        = ""     # string | computed

  admin_contact { # list
    address_line_1    = ""     # string | optional
    address_line_2    = ""     # string | optional
    city              = ""     # string | optional
    contact_type      = ""     # string | optional
    country_code      = ""     # string | optional
    email             = ""     # string | optional
    fax               = ""     # string | optional
    first_name        = ""     # string | optional
    last_name         = ""     # string | optional
    organization_name = ""     # string | optional
    phone_number      = ""     # string | optional
    state             = ""     # string | optional
    zip_code          = ""     # string | optional

    extra_param { # list
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  registrant_contact { # list
    address_line_1    = ""     # string | optional
    address_line_2    = ""     # string | optional
    city              = ""     # string | optional
    contact_type      = ""     # string | optional
    country_code      = ""     # string | optional
    email             = ""     # string | optional
    fax               = ""     # string | optional
    first_name        = ""     # string | optional
    last_name         = ""     # string | optional
    organization_name = ""     # string | optional
    phone_number      = ""     # string | optional
    state             = ""     # string | optional
    zip_code          = ""     # string | optional

    extra_param { # list
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  tech_contact { # list
    address_line_1    = ""     # string | optional
    address_line_2    = ""     # string | optional
    city              = ""     # string | optional
    contact_type      = ""     # string | optional
    country_code      = ""     # string | optional
    email             = ""     # string | optional
    fax               = ""     # string | optional
    first_name        = ""     # string | optional
    last_name         = ""     # string | optional
    organization_name = ""     # string | optional
    phone_number      = ""     # string | optional
    state             = ""     # string | optional
    zip_code          = ""     # string | optional

    extra_param { # list
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

