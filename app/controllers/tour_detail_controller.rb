class TourDetailController < ApplicationController
  def index
    if params[:tour_id].nil?
      @tour = Tour.includes(:city,:category,:tour_photos).first
      flash[:notice] = "Параметр не задан, показана первая экскурсия"
    else
      @tour = Tour.includes(:city,:category,:tour_photos).find_by_id(params[:tour_id])
      if @tour.nil?
        flash[:notice] = "Параметр задан не верно, переход на главную"
        redirect_to excurs_index_path
      else
        #cookies.delete :view_history
        side_tour = add_cookie(@tour.id)
        #@side_tour = Tour.includes(:city,:category,:tour_photos).find(side_tour)
        # используем where, поскольку туры ID из истории могли быть удалены или убраны с публикации
        @side_tour = Tour.includes(:city,:category,:tour_photos).where("id IN (?)", side_tour)
      end
    end


  end

  def add_cookie(element)
    store = ((cookies[:view_history].nil? ? [] : cookies[:view_history].split("&")) + Array.new(4)).flatten[0..3]
    unless store.include? element.to_s
      store.unshift(element.to_s)
      store.pop
    end
    cookies.delete :view_history
    cookies[:view_history] = store.compact
    return (store - [element.to_s]).compact
  end

  def del_cookie(element)
    store = cookies[:view_history].nil? ? [] : cookies[:view_history].split("&")
    if store.include? element.to_s
      store=(store - [element.to_s]).compact
    end
    cookies.delete :view_history
    cookies[:view_history] = store
    return store
  end

  def deltour
    respond_to do |format|
      if params[:tour].nil? or params[:cur_tour].nil?
        flash[:notice] = "Параметры не заданы"
        format.html { redirect_to tour_detail_index_path }
      else
        side_tour = del_cookie(params[:tour]) - [params[:cur_tour]]
        @tour = Tour.includes(:city,:category,:tour_photos).find_by_id(params[:cur_tour])
        @side_tour = Tour.includes(:city,:category,:tour_photos).where("id IN (?)", side_tour)
        format.html { redirect_to tour_detail_index_path }
        format.js #{@page1 =  }
      end
    end
  end

end
