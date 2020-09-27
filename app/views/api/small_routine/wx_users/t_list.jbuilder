json.status 200
json.message '获取成功'
json.size @record.size
json.data do
  json.array! @record do |lp|
    json.id lp[1].first.id
    json.number lp[1].first.number
    json.title lp[1].first.title
    json.describe lp[1].first.describe
    json.created_at lp[1].first.created_at && lp[1].first.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.updated_at lp[1].first.updated_at && lp[1].first.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
