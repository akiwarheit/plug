class MobileController < ApplicationController
  
  def login
    @note = Note.find(params[:id])
    
    respond_to do |format|
      format.json  { render :json => @note }
    end
  end
  
  def register
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    
    respond_to do |format|
      format.json  { render :json => @user }
    end
  end
  
  def upload_notebook
  end
  
end
