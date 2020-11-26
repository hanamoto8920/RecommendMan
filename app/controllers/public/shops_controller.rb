class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    place = Place.find_by(id: params[:place])
    @places = Place.all.order(created_at: :desc)
    if place.nil?
      @shops = Shop.all.order(created_at: :desc)
    else
      @shops = Shop.where(place_id: place.id).order(created_at: :desc)
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
    params.require(:shop).permit(:name, :url, :introduction, :image, :category, :address, :opentime ,:place_id)
  end

end
