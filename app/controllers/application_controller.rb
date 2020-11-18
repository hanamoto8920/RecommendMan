class ApplicationController < ActionController::Base

  # 検索機能 ransack
  before_action :set_search
  def set_search
    @search = Shop.ransack(params[:q]) #ransackメソッド推奨
    @search_shops = @search.result.all
  end

end
