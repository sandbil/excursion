class CategoryTourController < ApplicationController
  def index
    flag_redirect = false
    if params[:city_id].nil? or params[:category_id].nil?
      flash[:notice] = "Параметр не задан, переход на главную"
      flag_redirect = true
    else
      @city = City.find_by_id(params[:city_id])
      @category = Category.find_by_id(params[:category_id])
      if @city.nil? or @category.nil?
        flash[:notice] = "Параметр задан не верно, переход на главную"
        flag_redirect = true
      end
    end

    redirect_to excurs_index_path if flag_redirect

    @tours = Tour.where(category_id: @category, city_id: @city ).includes(:city,:category,:tour_photos)
    @tours_count = Tour.where(category_id: @category, city_id: @city).count
  end
end
