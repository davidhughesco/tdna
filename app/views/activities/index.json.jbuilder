json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :area_name, :area_id, :order_id
  json.url activity_url(activity, format: :json)
end
