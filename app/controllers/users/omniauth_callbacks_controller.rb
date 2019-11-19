# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_from :google
  end

  def facebook
    callback_from :facebook
  end
  private

  def callback_from(provider)
    provider = provider.to_s
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "google") if is_navigational_format?
    else
      session[:name] = @user.name
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to new_user_registration_path
    end
  end
end
