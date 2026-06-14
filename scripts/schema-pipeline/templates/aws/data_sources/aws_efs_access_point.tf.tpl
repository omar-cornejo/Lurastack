# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_efs_access_point                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_efs_access_point" "this" {

  access_point_id = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # file_system_arn = ""     # string | computed
  # file_system_id  = ""     # string | computed
  # owner_id        = ""     # string | computed
  # posix_user = [  # list(object)
  #   {
  #     gid = 0
  #     secondary_gids = []  # set(number)
  #     uid = 0
  #   }
  # ]
  # root_directory = [  # list(object)
  #   {
  #     creation_info = [  # list(object)
  #       {
  #         owner_gid = 0
  #         owner_uid = 0
  #         permissions = ""
  #       }
  #     ]
  #     path = ""
  #   }
  # ]

}

