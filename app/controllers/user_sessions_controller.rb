class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def show
    redirect_to :action => :new
  end
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(User.find_by_email_address(params[:user_session][:email_address]))
    if @user_session.save
      flash[:notice] = "Sign in successful"
      redirect_to account_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "You've been signed out"
    redirect_to :signout
  end
end