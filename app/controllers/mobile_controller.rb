class MobileController < ApplicationController
  respond_to :json
  
  def login
    
    # resource = User.find_for_database_authentication(:login=>params[:user_login][:login])
    # resource.valid_password?(params[:user_login][:password])
    
    # @users = User.all
    
    @user = User.find_by_email(params[:email])
    
    if @user != nil
     if @user.valid_password?(params[:password])
      respond_with(@user)
      else
        respond_with(nil)
      end     
    else
      respond_with(nil)
    end
    
  end
  
  def register
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    
    respond_to do |format|
      format.json  { render :json => @user }
    end
  end
  
  def upload_notebook
    @user = User.find(params[:user_id])
    @new_notebook = Notebook.create(:user_id => @user.id, :description => params[:description])
      
    respond_with(@new_notebook) 
  end
  
  def upload_note
    @user = User.find(params[:user_id])
    @note = Note.create(:user_id => @user.id, :title => params[:title], :content => params[:content], :notebook_id => params[:notebook_id])
    
    respond_with(@note)
  end
  
end
