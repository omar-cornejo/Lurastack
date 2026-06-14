# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53domains_registered_domain                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53domains_registered_domain" "this" {

  domain_name         = ""     # string | required
  admin_privacy       = false  # bool | optional
  auto_renew          = false  # bool | optional
  billing_privacy     = false  # bool | optional
  id                  = ""     # string | optional+computed
  registrant_privacy  = false  # bool | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  tech_privacy        = false  # bool | optional
  transfer_lock       = false  # bool | optional

  # abuse_contact_email = ""     # string | computed
  # abuse_contact_phone = ""     # string | computed
  # creation_date       = ""     # string | computed
  # expiration_date     = ""     # string | computed
  # registrar_name      = ""     # string | computed
  # registrar_url       = ""     # string | computed
  # reseller            = ""     # string | computed
  # status_list         = []     # list(string) | computed
  # updated_date        = ""     # string | computed
  # whois_server        = ""     # string | computed

  admin_contact { # list [0..1]
    address_line_1    = ""     # string | optional+computed
    address_line_2    = ""     # string | optional+computed
    city              = ""     # string | optional+computed
    contact_type      = ""     # string | optional+computed
    country_code      = ""     # string | optional+computed
    email             = ""     # string | optional+computed
    extra_params      = {}     # map(string) | optional+computed
    fax               = ""     # string | optional+computed
    first_name        = ""     # string | optional+computed
    last_name         = ""     # string | optional+computed
    organization_name = ""     # string | optional+computed
    phone_number      = ""     # string | optional+computed
    state             = ""     # string | optional+computed
    zip_code          = ""     # string | optional+computed

  }

  billing_contact { # list [0..1]
    address_line_1    = ""     # string | optional+computed
    address_line_2    = ""     # string | optional+computed
    city              = ""     # string | optional+computed
    contact_type      = ""     # string | optional+computed
    country_code      = ""     # string | optional+computed
    email             = ""     # string | optional+computed
    extra_params      = {}     # map(string) | optional+computed
    fax               = ""     # string | optional+computed
    first_name        = ""     # string | optional+computed
    last_name         = ""     # string | optional+computed
    organization_name = ""     # string | optional+computed
    phone_number      = ""     # string | optional+computed
    state             = ""     # string | optional+computed
    zip_code          = ""     # string | optional+computed

  }

  name_server { # list [0..6]
    name     = ""     # string | required
    glue_ips = []     # set(string) | optional

  }

  registrant_contact { # list [0..1]
    address_line_1    = ""     # string | optional+computed
    address_line_2    = ""     # string | optional+computed
    city              = ""     # string | optional+computed
    contact_type      = ""     # string | optional+computed
    country_code      = ""     # string | optional+computed
    email             = ""     # string | optional+computed
    extra_params      = {}     # map(string) | optional+computed
    fax               = ""     # string | optional+computed
    first_name        = ""     # string | optional+computed
    last_name         = ""     # string | optional+computed
    organization_name = ""     # string | optional+computed
    phone_number      = ""     # string | optional+computed
    state             = ""     # string | optional+computed
    zip_code          = ""     # string | optional+computed

  }

  tech_contact { # list [0..1]
    address_line_1    = ""     # string | optional+computed
    address_line_2    = ""     # string | optional+computed
    city              = ""     # string | optional+computed
    contact_type      = ""     # string | optional+computed
    country_code      = ""     # string | optional+computed
    email             = ""     # string | optional+computed
    extra_params      = {}     # map(string) | optional+computed
    fax               = ""     # string | optional+computed
    first_name        = ""     # string | optional+computed
    last_name         = ""     # string | optional+computed
    organization_name = ""     # string | optional+computed
    phone_number      = ""     # string | optional+computed
    state             = ""     # string | optional+computed
    zip_code          = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

