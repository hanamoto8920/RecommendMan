class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    genre = Genre.find_by(id: params[:genre])
    place = Place.find_by(id: params[:place])
    @places = Place.all
    @genres = Genre.all
    if place.nil? && genre.nil?
      @search_shops = Shop.all
    elsif genre.nil?
      @search_shops = Shop.where(place_id: place.id)
    else
      @search_shops = Shop.where(genre_id: genre.id)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path
    else
      @shops = Shop.all
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else 
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :url, :introduction, :image, :genre_id, :place_id)
  end

end
