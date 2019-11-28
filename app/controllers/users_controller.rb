class UsersController < ApplicationController

  def show
    
  end

  def destroy
  
  end

  def new
    @personal = User.find(current_user.id)
  end

  def create

  end

end