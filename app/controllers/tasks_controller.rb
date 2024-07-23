class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :accept]
  before_action :set_user

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.except(:category_id))
    @task.user = current_user
    @task.sub_category_id = find_sub_category_id(params[:task][:category_id])
    @task.status = "not_started" # Set the status of the task

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task.sub_category_id = find_sub_category_id(params[:task][:category_id])

    if @task.update(task_params.except(:category_id))
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully destroyed.'
    else
      render :edit
    end
  end

  def show
    @task = Task.includes(:steps).find(params[:id])
  end

  # def index
  #   @tasks = if params[:status].present?
  #              case params[:status]
  #              when 'in_progress'
  #                Task.with_completed_steps
  #              when 'not_started'
  #                Task.where(status: 'not_started')
  #              else
  #                Task.all
  #              end
  #            else
  #              Task.with_completed_steps
  #            end
  # end

  def accept
    if @task.status == "not_started"
      if @task.update(status: "in_progress")
        update_user_stats(@user, @task)
        redirect_to tasks_path, notice: 'Task was successfully accepted.'
      else
        render :show, alert: 'Could not update the task.'
      end
    else
      redirect_to @task, alert: 'Task is not in a state that can be accepted.'
    end
  end

  def not_started
    @tasks = Task.where(status: 'not_started')
  end

  def in_progress
    @tasks = Task.where(status: 'in_progress')
  end

  def completed
    @tasks = Task.where(status: 'completed')
  end

  def index
    if params[:status].present?
      @tasks = Task.where(status: params[:status])
    else
      @tasks = Task.all
    end
    case params[:steps]
    when 'completed'
      @tasks = @tasks.with_completed_steps
    when 'uncompleted'
      @tasks = @tasks.with_uncompleted_steps
    end
  end

  private

  def set_default_status
    self.status ||= 'not_started'
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def task_params
    params.require(:task).permit(:title, :description, :category_id, :sub_category_id, :time, :urgence, steps_attributes: [:id, :title, :content, :completed])
  end

  def find_sub_category_id(category_id)
    SubCategory.find_by(category_id: category_id)&.id
  end
end

  def update_user_stats(user, task)
    rewards = task.category_rewards
    rewards.each do |reward|
      case reward
      when /STR/
        user.increment!(:str, 1) # Augmente la statistique STR
      when /INT/
        user.increment!(:int, 1) # Augmente la statistique INT
      when /MANA/
        user.increment!(:mana, 1) # Augmente la statistique MANA
      when /DEX/
        user.increment!(:dex, 1) # Augmente la statistique DEX
      when /CHA/
        user.increment!(:cha, 1) # Augmente la statistique CHA
      end
    end
end
