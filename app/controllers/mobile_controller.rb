class MobileController < ApplicationController
  respond_to :json
  
  def login
    @user = User.find_by_email(params[:email])
    # @users = User.all
    respond_with(@user)
    
  end
  
  def register
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    
    respond_to do |format|
      format.json  { render :json => @user }
    end
  end
  
  def upload_notebook
    @user = User.find(params[:user_id])
    # @notebook = @user.notebooks.build(params[:notebook])
    @new_notebook = Notebook.create(:user_id => @user.id, :description => params[:description])
    # @notebook = @user.notebooks.build(@prenotebook)
    
   respond_with(@new_notebook) 
    
  end
  
  def upload_note
    @user = User.find(params[:user_id])
    @note = Note.create(:user_id => @user.id, :title => params[:title], :content => params[:content])
  end
  
end
