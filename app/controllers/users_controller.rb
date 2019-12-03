class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :profile, :profile_update]
  
  def show
    
  end

  def destroy
  
  end

  def edit
    
  end

  def update
    confirmed_address = ConfirmedAddress.new(address_params)
    if confirmed_address.save
      redirect_to user_path
    else
      render :edit
    end
  end

  def profile

  end

  def profile_update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :profile
    end
  end

  def ready
  
  end

private

  def address_params
    params.require(:user).permit(
      :zip_code,
      :prefecture,
      :city,
      :house_number,
      :building_name
    ).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(
      :name,
      :profile,
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

end