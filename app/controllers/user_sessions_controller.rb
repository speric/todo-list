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
    @user_session.remember_me = params[:user_session][:remember_me] == "0" ? false : true
    
    if @user_session.save
      @user_session
      flash[:notice] = "Sign in successful"
      redirect_to items_path
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