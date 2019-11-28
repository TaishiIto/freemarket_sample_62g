class UsersController < ApplicationController

  def show
    
  end

  def destroy
  
  end

  def edit

    @user = User.find(current_user.id)
    
  end

  def update
    binding.pry
    @user = confirmed_address.new(address_params)
      if @user.save
          render users_path
      else
          render new_user_path
      end
  end

private

def address_params

end


end