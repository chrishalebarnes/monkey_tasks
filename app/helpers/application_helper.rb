module ApplicationHelper
  def tasks_active?
  	params[:controller] == 'tasks'
  end
end
