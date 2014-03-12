module TourDetailHelper
  def make_link_delete(tour, cur_tour)
    link_to "×", tour_detail_deltour_path(tour: tour, cur_tour: cur_tour), remote: true, title: "Удалить"
  end
end
