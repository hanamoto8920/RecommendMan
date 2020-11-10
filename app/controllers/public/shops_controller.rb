class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to shops_path
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :url, :introduction, :image)
  end

end
