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
    callback = request.env['omniauth.auth']
    provider = provider.to_s
    user = User.where(uid: callback.uid, provider: provider).first
    unless user
      @user = User.new
      @user.build_address
      @user.name = callback.info.name
      @user.email = callback.info.email
      @user.password = password
      session[:uid] = callback.uid
      session[:provider] = provider
      render template: "signup/step1"
    else
      sign_in_and_redirect user, event: :authentication
    end
  end

  def password
    a = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    pass = Array.new(20){a[rand(a.size)]}.join
    return pass
  end
end
