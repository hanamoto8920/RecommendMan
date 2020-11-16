class ApplicationController < ActionController::Base
  
  # 検索機能 ransack
  before_action :set_search
  def set_search
    @search = Shop.ransack(params[:q]) #ransackメソッド推奨
    @search_shops = @search.result.all
  end
  
  # ログイン後、遷移ページ
  def after_sign_in_path_for(resource)
    root_path
  end
  
  
  
end
