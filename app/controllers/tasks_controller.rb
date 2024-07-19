class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
    @user = current_user
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
    @user = current_user
  end

  def index
    @tasks = Task.all
    if params[:status] == 'in_progress'
      @tasks = Task.with_completed_steps
    elsif params[:status] == 'not_started'
      @tasks = Task.where(status: 'not_started')
    else
      @tasks = Task.all
    end
    @user = current_user
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :sub_category_id, :time, :urgence, steps_attributes: [:id, :title, :content, :completed, :_destroy])
  end

  def update_steps
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task, notice: 'The steps have been successfully updated'
    else
      render :edit
    end
  end
end
