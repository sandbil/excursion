module ToursHelper
  def name_city(tour)
    tour.city.nil? ? "неизвестный город (Id #{tour.city_id})" :  tour.city.name
  end
  def name_category(tour)
    tour.category.nil? ? "неизвестная категория (Id #{tour.category_id})" :  tour.category.name
  end

end
