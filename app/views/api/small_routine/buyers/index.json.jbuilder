json.status 200
json.message '获取成功'
json.size @record.size
json.total_count @record.total_count
json.data do
  json.array! @record do |lp|
    json.id lp.id
    json.sn lp.sn
    json.user_id lp.user_id
    json.user_name lp.user_id && lp.user && lp.user.name.nil? ? '匿名用户' : lp.user.name 
    json.user_contact lp.user_id && lp.user && lp.user.contact.nil? ? '无内容' : lp.user.contact 
    json.user_qrcode lp.user_id && lp.user && lp.user.qrcode && lp.user.qrcode.url
    json.title lp.title
    json.product lp.product
    json.quantity lp.quantity
    json.description lp.description
    json.avatar lp.avatar
    json.avatar_url lp.avatar_url
    json.created_at lp.created_at && lp.created_at.strftime("%Y-%m-%d %H:%M")
    json.updated_at lp.updated_at && lp.updated_at.strftime("%Y-%m-%d %H:%M")
  end
end