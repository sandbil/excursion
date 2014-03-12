module ApplicationHelper

  def make_link_gategory_with_city(tour)
    link_to(name_category_front(tour), category_tour_index_path(city_id:tour.city, category_id: tour.category_id))
  end

  def make_link_city(city, city_name )
    link_to(city_name, city_tour_index_path(city_id: city))
  end

  def name_category_front(tour)
    tour.category.nil? ? "неизвестная категория" :  tour.category.name
  end
end
