json.status 200
json.message '获取成功'
json.data do
  json.id @record.id
  json.sn @record.sn
  json.user_id @record.user_id
  json.user_name @record.user_id && @record.user && @record.user.name.nil? ? '匿名用户' : @record.user.name 
  json.user_contact @record.user_id && @record.user && @record.user.contact.nil? ? '无内容' : @record.user.contact 
  json.user_qrcode @record.user_id && @record.user && @record.user.qrcode && @record.user.qrcode.url
  json.title @record.title
  json.logo @record.logo
  json.product @record.product
  json.price @record.price
  json.quantity @record.quantity
  json.avatar @record.avatar
  json.main_category_id @record.main_category_id
  json.main_category @record.main_category_id && @record.main_category && @record.main_category.name
  json.sub_category_id @record.sub_category_id
  json.sub_category @record.sub_category_id && @record.sub_category && @record.sub_category.name
  json.created_at @record.created_at && @record.created_at.strftime("%Y-%m-%d %H:%M")
  json.updated_at @record.updated_at && @record.updated_at.strftime("%Y-%m-%d %H:%M")
end
