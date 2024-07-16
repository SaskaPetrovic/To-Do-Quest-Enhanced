class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Quest was successfully created.'
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.where(status: params[:status] || 'in_progress')
    @tasks = Task.all
  end

  private

  def task_params
    params.required(:task).permit(:title, :description, :sub_category_id, :time, :urgence)
  end
end
