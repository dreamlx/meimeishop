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
    json.price lp.price
    json.quantity lp.quantity
    json.avatar lp.avatar
    json.main_category_id lp.main_category_id
    json.main_category lp.main_category_id && lp.main_category && lp.main_category.name
    json.sub_category_id lp.sub_category_id
    json.sub_category lp.sub_category_id && lp.sub_category && lp.sub_category.name
    json.created_at lp.created_at && lp.created_at.strftime("%Y-%m-%d %H:%M")
    json.updated_at lp.updated_at && lp.updated_at.strftime("%Y-%m-%d %H:%M")
  end
end