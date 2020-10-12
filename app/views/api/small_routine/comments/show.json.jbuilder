json.status 200
json.message '获取成功'
json.data do
  json.id @record.id
  json.body @record.body
  json.resource_type @record.resource_type
  json.resource_id @record.resource_id
  json.author_type @record.author_type
  json.author_id @record.author_id
  json.author_name @record.author_name
  json.created_at @record.created_at && @record.created_at.strftime("%Y-%m-%d %H:%M")
  json.updated_at @record.updated_at && @record.updated_at.strftime("%Y-%m-%d %H:%M")
end
