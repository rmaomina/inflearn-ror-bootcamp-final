class RestaurantController < ApplicationController
  def list
  end

  def detail
    @item = Restaurant.find(params[:id])
    @reviews = Post.where(restaurant: @item).all
  end

  def search
  end

  def map
    minLat = params[:minLat]
    minLng = params[:minLng]
    maxLat = params[:maxLat]
    maxLng = params[:maxLng]
    
    @items = Restaurant.where("lat >= ? AND lat <= ?", minLat, maxLat).where("lng >= ? AND lng <= ?", minLng, maxLng).all
    
    render :layout => false
  end

  def new
  end

  def create
    lat = params[:lat]
    lng = params[:lng]
    address = params[:address]
    
    name = params[:name]
    description = params[:description]
    images = params[:images]
    
    item = Restaurant.new
    item.user = current_user
    item.lat = lat
    item.lng = lng
    item.address = address
    item.name = name
    item.description = description
    item.images = images
    item.save 
    
    redirect_to controller:'restaurant', action:'list'
  end

  def modify
  end

  def update
  end

  def delete
  end
end
