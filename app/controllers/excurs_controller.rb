class ExcursController < ApplicationController


  def index
     @cities = City.where("id in (select city_id from tours where public = true)") #.includes(tours: [:category,:tour_photos])
     @page=1
  end


  def display
    if params[:city].nil?
      @city = City.where("id in (select city_id from tours where public = true)").first
      flash[:notice] = "Параметр не задан, показан первый город"
    else
      @city = City.find(params[:city])
    end
    unless params[:page].nil?
      @page = params[:page]
    else
      @page =1
    end
    respond_to do |format|
      if params[:city].nil? or params[:page].nil?
        flash[:notice] = "Параметры не заданы"
        format.html { redirect_to excurs_index_path }
      else
        format.html { redirect_to excurs_index_path }
        format.js {@page1 = @page, @city1 = @city  }
      end
    end

  end
end
