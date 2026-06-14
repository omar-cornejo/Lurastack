# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_gke_hub_membership_binding                       │
# └──────────────────────────────────────────────────────────────┘
data "google_gke_hub_membership_binding" "this" {

  location              = ""     # string | required | Location of the membership
  membership_binding_id = ""     # string | required | The client-provided identifier of the membership binding.
  membership_id         = ""     # string | required | Id of the membership
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional

  # create_time           = ""     # string | computed | Time the MembershipBinding was created in UTC.
  # delete_time           = ""     # string | computed | Time the MembershipBinding was deleted in UTC.
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # labels                = {}     # map(string) | computed | Labels for this Membership binding.   **Note**: This field i…
  # name                  = ""     # string | computed | The resource name for the membershipbinding itself
  # scope                 = ""     # string | computed | A Workspace resource name in the format 'projects/*/location…
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                   = ""     # string | computed | Google-generated UUID for this resource.
  # update_time           = ""     # string | computed | Time the MembershipBinding was updated in UTC.

}

