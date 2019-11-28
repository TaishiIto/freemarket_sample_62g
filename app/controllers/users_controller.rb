class UsersController < ApplicationController

  def show
    
  end

  def destroy
  
  end

  def edit

    @user = User.find(params[:id])
    
  end

  def update
    confirmed_address = ConfirmedAddress.new(address_params)
    if confirmed_address.save
      redirect_to user_path
    else
      render :edit
    end
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


end