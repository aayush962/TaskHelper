class TasksController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def index
    @user = current_user
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @new_task = Task.create(task_params)
    @new_task.user_id = current_user.id
    if @new_task.save
    redirect_to '/'
  else
    redirect_to '/signup'
  end
  end
 
  private
    def task_params
      params.require(:task).permit(:title, :notes, :priority)
    end
end
