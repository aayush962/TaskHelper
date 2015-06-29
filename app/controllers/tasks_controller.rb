class TasksController < ApplicationController

  before_action :require_user, only: [:index, :show, :destroy]

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
  def destroy
  @ntask = Task.find(params[:id])
  if @ntask.destroy
    redirect_to '/'
  else
    redirect_to '/'

end
end

  def edit
    @update_task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    @task.update
  end
 
  private
    def task_params
      params.require(:task).permit(:title, :notes, :priority, :due)
    end

