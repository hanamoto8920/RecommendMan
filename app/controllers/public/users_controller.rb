class Public::UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
  end 
  
  def complete 
  end 
  
  def edit 
  end 
  
end
