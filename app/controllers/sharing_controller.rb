class SharingController < ApplicationController
  def index
    if(Share.exists?(from_user_id: params[:user_id], to_user_id: @current_user.id))
      @tasks = Task.where(user_id: params[:user_id])
    else
      redirect_to tasks_url
    end
  end

  def share
    @share = Share.new
  	@share.from_user_id = @current_user.id
  	@share.to_user_id = share_params[:id]
  	respond_to do |format|
	  if @share.save
	    format.html { redirect_to tasks_url, notice: 'Task list has been shared successfully.' }
	  else
	    format.html { redirect_to tasks_url, notice: 'Task list share was unsuccessful'}
	  end
    end
  end

  def shared
  	@shared = Share.includes(:user).where(to_user_id: @current_user.id)
  end

  private

    # Whitelist parameters and set the user association
    def share_params
      params.require(:share).permit(:id)
    end    
end