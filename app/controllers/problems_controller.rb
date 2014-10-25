class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show]

  def new
    # @user = current_user_id
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problem_path(@problem.id), notice: "Problem saved successfully"
    else
      render :new, notice: "Invalid problem input"
    end
  end

  def index
    @problems = Problem.all
  end

  def show
    # @notes = Note.find(params[:id])
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:user_id, :description, :tried )
  end
end
