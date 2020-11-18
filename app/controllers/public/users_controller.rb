class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:complete]

  def show
    @user = User.find(current_user.id)
  end

  def complete
  end

  def edit
  end

end
