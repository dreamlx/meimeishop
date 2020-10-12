json.status 200
json.message '获取成功'
json.size @record.size
json.total_count @record.total_count
json.data do
  json.array! @record do |lp|
    json.id lp.id
    json.body lp.body
    json.resource_type lp.resource_type
    json.resource_id lp.resource_id
    json.author_type lp.author_type
    json.author_id lp.author_id
    json.author_name lp.author_name
    json.created_at lp.created_at && lp.created_at.strftime("%Y-%m-%d %H:%M")
    json.updated_at lp.updated_at && lp.updated_at.strftime("%Y-%m-%d %H:%M")
  end
end
