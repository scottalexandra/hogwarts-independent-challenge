class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
  end

  def index
    @professors = Professor.all
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update!(professor_params)
    redirect_to '/professors'
  end

  private

  def professor_params
    params.permit(:name, :age, :specialty)
  end
end
