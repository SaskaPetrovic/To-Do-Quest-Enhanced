class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @task, notice: 'Quest was successfully created.'
    else
      render :new
    end
  end

  def edit
   # @task.steps.build if @task.steps.empty?
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Quest was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Quest was successfully destroyed.'
    else
      render :edit
    end
  end

  def show
    @task = Task.includes(:steps).find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :sub_category_id, :time, :urgence, steps_attributes: [:id, :title, :description, :completed, :_destroy])
  end
end
