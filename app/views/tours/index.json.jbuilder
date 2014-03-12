json.array!(@tours) do |tour|
  json.extract! tour, :id, :name, :description, :, :timg, :price, :city_id, :, :category_id, :
  json.url tour_url(tour, format: :json)
end
