class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save # => true or false
    # redirect to the show page for the restaurant we just created
    redirect_to task_path(@task), status: :see_other
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # get the task with the given id from the database
    @task = Task.find(params[:id])
    # update the task with the given params
    @task.update(task_params)
    # redirect to the show page for the task we just updated
    redirect_to task_path(@task), status: :see_other # => show action
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other # => show action
  end

  private

  def task_params
    # params[:task] # => not permitted
    params.require(:task).permit(:title, :details) # => permitted
  end
end
