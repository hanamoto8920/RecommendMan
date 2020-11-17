class Public::UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def complete
  end

  def edit
  end

end
