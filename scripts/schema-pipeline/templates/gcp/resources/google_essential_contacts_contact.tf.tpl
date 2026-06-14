# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_essential_contacts_contact                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_essential_contacts_contact" "this" {

  email                               = ""     # string | required | The email address to send notifications to. This does not ne…
  language_tag                        = ""     # string | required | The preferred language for notifications, as a ISO 639-1 lan…
  notification_category_subscriptions = []     # list(string) | required | The categories of notifications that the contact will receiv…
  parent                              = ""     # string | required | The resource to save this contact for. Format: organizations…
  id                                  = ""     # string | optional+computed

  # name                                = ""     # string | computed | The identifier for the contact. Format: {resourceType}/{reso…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

