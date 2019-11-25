class SignupController < ApplicationController

  def step1 
    @user = User.new
    @user.build_address
  end

  def step2 # step1情報をsessionメソッドで保持
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password]
    @user = User.new
    @user.build_address
  end
  
  def step3 # 前のページの情報をsessionメソッドで保持
    session[:family_name_kanji] = user_params[:family_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = Date.new(user_params["birthday(1i)"]&.to_i, user_params["birthday(2i)"]&.to_i, user_params["birthday(3i)"]&.to_i)
    session[:phone_number] = user_params[:phone_number]
    session[:zip_code] = params[:user][:address_attributes][:zip_code]
    session[:prefecture_id] = params[:user][:address_attributes][:prefecture_id]
    session[:city] = params[:user][:address_attributes][:city]
    session[:house_number] = params[:user][:address_attributes][:house_number]
    session[:building_name] = params[:user][:address_attributes][:building_name]
    @user = User.new
    @user.build_address
    redirect_to controller: 'cards', action: 'new'
  end

  def save #createアクション内で、今まで保管したsessionのデータを渡し、DBに保存する
    User.create!(
    name: session[:name],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    phone_number: session[:phone_number],
    family_name_kanji: session[:family_name_kanji],
    first_name_kanji: session[:first_name_kanji],
    family_name_kana: session[:family_name_kana],
    first_name_kana: session[:first_name_kana],
    birthday: session[:birthday],
    uid: session[:uid],
    provider: session[:provider],
  )
    user = User.find_by(email: session[:email])
    Address.create(
      zip_code: session[:zip_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      user_id: user.id
  )
    user = User.find_by(email: session[:email])
    Card.create(
      customer_id: session[:customer_id],
      card_id: session[:card_id],
      user_id: user.id
  )

    if user
      # ログインするための情報を保管
      session[:id] = user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1' # 登録画面に戻る
    end
  end

  def done # 一括登録後、自動的にサインインさせる
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :first_name_kana,
      :birthday,
      :phone_number,
      :profile,
      :image,
      :uid,
      :provider,
      :encrypted_password,
      address_attributes:
      [:zip_code,
      :prefecture_id,
      :city,
      :house_number,
      :building_name],
      card_attributes:
      [:customer_id,
      :card_id]
    )
  end
end
