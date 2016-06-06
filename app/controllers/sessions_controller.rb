class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user.save
      login_user!(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
