json.array! @messages do |message|
  json.text message.text
  json.image message.image
  json.created_at message.created_at.in_time_zone("Tokyo").strftime("%Y/%m/%d(%a) %H:%M:%S")
  json.user_name message.user.name
  json.id message.id
  json.group_id message.group_id
end