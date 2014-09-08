class SessionsController < ApplicationController
  def new
  end

  def create
    flash[:errors] = []
    auth = env["omniauth.auth"]
    user = User.find_by_email(auth.info.email)
    if user
      sign_in user
      redirect_back_or_root
    else
      user = User.new
      user.from_omniauth(auth)
      if user.save
        sign_in user
        redirect_back_or_root
      else
        flash[:errors].push "There was an error logging into Facebook."
        redirect_to root_path
      end
    end
  end

  def destroy
  end
end