class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
    @task.steps.build
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
    @task.steps.build if @task.steps.empty?
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Quest was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_url, notice: 'Quest was successfully destroyed.'
  end

  def show

  end

  def index
    @tasks = Task.where(status: params[:status] || 'in_progress')
    @tasks = Task.all
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title, :description, :sub_category_id, :time, :urgence, :status,
      steps_attributes: [:id, :content, :completed, :_destroy]
    )
  end
end
