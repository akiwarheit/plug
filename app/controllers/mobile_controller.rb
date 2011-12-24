class MobileController < ApplicationController
  
  def login
    @user = User.where(:email => params[:email])
    
    respond_to do |format|
      format.json  { render :json => @user }
    end
  end
  
  def register
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    
    respond_to do |format|
      format.json  { render :json => @user }
    end
  end
  
  def upload_notebook
    @notebook = Notebook.create(params[:notebook])
    
    
  end
  
end
