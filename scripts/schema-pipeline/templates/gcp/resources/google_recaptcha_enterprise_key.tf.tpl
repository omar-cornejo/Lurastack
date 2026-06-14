# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_recaptcha_enterprise_key                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_recaptcha_enterprise_key" "this" {

  display_name     = ""     # string | required | Human-readable display name of this key. Modifiable by user.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | See [Creating and managing labels](https://cloud.google.com/…
  project          = ""     # string | optional+computed | The project for the resource

  # create_time      = ""     # string | computed | The timestamp corresponding to the creation of this Key.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | The resource id for the Key, which is the same as the Site K…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  android_settings { # list [0..1]
    allow_all_package_names = false  # bool | optional | If set to true, it means allowed_package_names will not be e…
    allowed_package_names   = []     # list(string) | optional | Android package names of apps allowed to use the key. Exampl…

  }

  ios_settings { # list [0..1]
    allow_all_bundle_ids = false  # bool | optional | If set to true, it means allowed_bundle_ids will not be enfo…
    allowed_bundle_ids   = []     # list(string) | optional | iOS bundle ids of apps allowed to use the key. Example: 'com…

  }

  testing_options { # list [0..1]
    testing_challenge = ""     # string | optional+computed | For challenge-based keys only (CHECKBOX, INVISIBLE), all cha…
    testing_score     = 0      # number | optional | All assessments for this Key will return this score. Must be…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  waf_settings { # list [0..1]
    waf_feature = ""     # string | required | Supported WAF features. For more information, see https://cl…
    waf_service = ""     # string | required | The WAF service that uses this key. Possible values: CA, FAS…

  }

  web_settings { # list [0..1]
    integration_type              = ""     # string | required | Required. Describes how this key is integrated with the webs…
    allow_all_domains             = false  # bool | optional | If set to true, it means allowed_domains will not be enforce…
    allow_amp_traffic             = false  # bool | optional | If set to true, the key can be used on AMP (Accelerated Mobi…
    allowed_domains               = []     # list(string) | optional | Domains or subdomains of websites allowed to use the key. Al…
    challenge_security_preference = ""     # string | optional+computed | Settings for the frequency and difficulty at which this key …

  }

}

