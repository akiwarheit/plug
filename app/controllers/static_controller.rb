class StaticController < ApplicationController
  
  def index
    if user_signed_in?
      @user = current_user
      @notebooks = @user.notebooks
      @notes_hash = @user.notes.group_by(&:notebook_id)
      
      @notes = @user.notes.group_by(&:id)
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

end
