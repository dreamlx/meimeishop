json.status 200
json.message '获取成功'
json.size @record.size
json.data do
  json.array! @record do |lp|
    json.id lp[1].last.id
    json.number lp[1].last.number
    json.title lp[1].last.title
    json.describe lp[1].last.describe
    json.created_at lp[1].last.created_at && lp[1].last.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.updated_at lp[1].last.updated_at && lp[1].last.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
