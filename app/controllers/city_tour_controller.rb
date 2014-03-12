class CityTourController < ApplicationController
  def index
    flag_redirect = false
    if params[:city_id].nil?
      flash[:notice] = "Параметр не задан, переход на главную"
      flag_redirect = true
    else
       @city = City.find_by_id(params[:city_id])
       if @city.nil?
         flash[:notice] = "Параметр задан не верно, переход на главную"
         flag_redirect = true
       end
    end

    if flag_redirect
      redirect_to excurs_index_path
    else
      @tours = Tour.where(city: @city ).includes(:city,:category,:tour_photos)
      @tours_count = @city.tours.count
    end
  end
end
