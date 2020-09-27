json.status 200
json.message '获取成功'
json.size @record.size
json.data do
  json.array! @record[1] do |lp|
    json.id lp.id
    json.number lp.number
    json.title lp.title
    json.describe lp.describe
    json.created_at lp.created_at && lp.created_at.strftime("%Y-%m-%d %H:%M")
    json.updated_at lp.updated_at && lp.updated_at.strftime("%Y-%m-%d %H:%M")
  end
end
