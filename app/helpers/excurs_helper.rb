module ExcursHelper
  def make_link_prev(page,city)
    link_to_if(page > 1,image_tag("prev.jpg"),excurs_display_path(page: page.to_i-1,city: city),remote: true, title: "Назад")
  end
  def make_link_next(page,city)
    link_to_if(page < Tour.pgcount(city).to_i, image_tag("next.jpg"),excurs_display_path(page: page.to_i+1,city: city),remote: true, title: "Далее")
  end
end
