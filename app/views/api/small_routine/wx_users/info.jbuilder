json.status 200
json.message '获取成功'
json.data do
  json.id @record.id
  json.user_id @record.user_id 
  json.token @record.authentication_token
  json.phone @record.user_id && @record.user && @record.user.phone
  json.name @record.user_id && @record.user && @record.user.name.nil? ? '匿名用户' : @record.user.name 
  json.qrcode @record.user_id && @record.user && @record.user.qrcode && @record.user.qrcode.url
  json.contact @record.user_id && @record.user && @record.user.contact.nil? ? '无内容' : @record.user.contact
  json.created_at @record.created_at && @record.created_at.strftime("%Y-%m-%d %H:%M")
  json.updated_at @record.updated_at && @record.updated_at.strftime("%Y-%m-%d %H:%M")

end
