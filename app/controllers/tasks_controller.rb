class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_user

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
    @tasks = if params[:status].present?
               case params[:status]
               when 'in_progress'
                 Task.with_completed_steps
               when 'not_started'
                 Task.where(status: 'not_started')
               else
                 Task.all
               end
             else
               # Si aucun paramètre status n'est présent, afficher les tâches "in_progress" par défaut
               Task.with_completed_steps
             end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def task_params
    params.require(:task).permit(:title, :description, :sub_category_id, :time, :urgence, steps_attributes: [:id, :title, :content, :completed, :_destroy])
  end
end
