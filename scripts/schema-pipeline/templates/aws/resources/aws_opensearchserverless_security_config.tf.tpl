# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_security_config            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_security_config" "this" {

  name           = ""     # string | required | Name of the policy.
  type           = ""     # string | required | Type of configuration. Must be `saml`.
  description    = ""     # string | optional | Description of the security configuration.

  # config_version = ""     # string | computed | Version of the configuration.
  # id             = ""     # string | computed

  saml_options { # single
    metadata        = ""     # string | required | The XML IdP metadata file generated from your identity provi…
    group_attribute = ""     # string | optional | Group attribute for this SAML integration.
    session_timeout = 0      # number | optional+computed | Session timeout, in minutes. Minimum is 5 minutes and maximu…
    user_attribute  = ""     # string | optional | User attribute for this SAML integration.

  }

}

