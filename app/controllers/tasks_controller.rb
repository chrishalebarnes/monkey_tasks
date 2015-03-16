class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  before_action :set_tasks, only: [:index, :create]
  before_action :set_new_task, only: [:index]
  before_action :set_users, only: [:index]

  def index
    @share = Share.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
      else
        format.html { redirect_to tasks_url}
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
      else
        format.html { redirect_to tasks_url, notice: 'Task could not be updated.' }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully deleted.' }
    end
  end

  def complete
    @task = Task.find(params[:task_id])
    @task.completed = true
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was completed successfully.' }
      else
        format.html { redirect_to tasks_url, notice: 'Task could not be completed.' }
      end
    end
  end

  private

    def set_users
      @users = User.where.not(id: @current_user.id)
    end
    
    def set_task
      @task = Task.find(params[:id])
    end

    def set_new_task
      @task = Task.new
    end

    def set_tasks
      @tasks = Task.where(user_id: @current_user.id)
    end

    # Whitelist parameters and set the user association
    def task_params
      params.require(:task).permit(:name).merge(user_id: @current_user.id)
    end
end
