class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :accept, :completed]
  before_action :set_user
  before_action :set_default_status, only: [:index]

  def new
    @task = Task.new
  end

  def index
    # Vérifie si le paramètre 'status' est présent
    if params[:status] == "in_progress"
      @tasks_current_user = Task.where(user: current_user)
      @tasks = @tasks_current_user.where(status: params[:status]).order(created_at: :desc)
    elsif params[:status].present?
      # Si oui, récupère les tâches avec le statut spécifié et les trie par date de création décroissante
      @tasks = Task.where(status: params[:status]).order(created_at: :desc)
    else
      # Sinon, récupère les tâches dont le statut n'est pas 'completed' ou 'deleted' et les trie par date de création décroissante
      @tasks = Task.where.not(status: ['completed', 'deleted']).order(created_at: :desc)
    end

    # Vérifie si le paramètre 'steps' est présent
    if params[:steps].present?
      # Si oui, effectue une action en fonction de la valeur du paramètre 'steps'
      case params[:steps]
      when 'completed'
        # Si 'steps' est égal à 'completed', récupère les tâches avec des étapes terminées
        @tasks = @tasks.with_completed_steps
      when 'uncompleted'
        # Si 'steps' est égal à 'uncompleted', récupère les tâches avec des étapes non terminées
        @tasks = @tasks.with_uncompleted_steps
      end
    end
  end

  def create
    @task = Task.new(task_params.except(:category_id))
    @task.user = current_user
    @task.sub_category_id = find_sub_category_id(params[:task][:category_id])
    @task.status = "not_started" # Définit le statut de la tâche à "not_started" par défaut

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
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
        format.json { render json: { success: true } }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: { error: 'Failed to delete task.' }, status: :unprocessable_entity }
      end
    end
  end

  def show
    @task = Task.includes(:steps).find(params[:id])
  end

  def accept
    if @task.status == "not_started"

      if @task.update(status: "in_progress", user: current_user)
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
    @task = Task.find(params[:id])
    if @task.status == "in_progress"
      if @task.update(status: "completed")
        @user.update_user_stats(@task)
        @user.add_experience(@task.xp_reward)
        @user.completed_tasks_count += 1
        achievement = check_and_create_achievement
        redirect_to tasks_path, notice:   achievement ? "You have unlocked a new achievement ! 🏆" : 'Task was successfully completed.'
      else
        render :show, alert: 'Could not update the task.'
      end
    else
      redirect_to @task, alert: 'Task is not in a state that can be completed.'
    end
  end

  private

def check_and_create_achievement
    # vérifier le nombre de tâches terminées par l'utilisateur
    case @user.completed_tasks_count
    when 1
      create_achievement('First Task Completed', 'You have completed your first task! 🥉')
      return true
    when 3
      create_achievement('Three Tasks Completed', 'You have completed three tasks! 🥈')
      return true
    when 5
      create_achievement('Five Tasks Completed', 'You have completed five tasks! 🥇')
      return true
    when 10
      create_achievement('Ten Tasks Completed', 'You have completed ten tasks! 🏅')
      return true
    when 15
      create_achievement('Fifteen Tasks Completed', 'You have completed fifteen tasks! 🎖')
      return true
    end
    return false
  end

  # titre et une description en paramètres
def create_achievement(title, description)
  # Création d'un nouvel achievement avec les paramètres spécifiés
  Achievement.create!(
    title: title,
    description: description,
    user: @user,
    sub_category: SubCategory.first
  )
end

  def set_default_status
    params[:status] ||= 'in_progress'
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
