json.text  @message.text
json.image  @message.image
json.user_id  @message.user_id
json.group_id  @message.group_id
json.created_at  @message.created_at.in_time_zone("Tokyo").strftime("%Y/%m/%d(%a) %H:%M:%S")