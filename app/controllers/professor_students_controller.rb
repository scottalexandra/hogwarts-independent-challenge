class ProfessorStudentsController < ApplicationController
  def destroy
    professor_student = ProfessorStudent.find_by(student_id: params[:student_id], professor_id: params[:professor_id])
    ProfessorStudent.destroy(professor_student.id)
    redirect_to "/professors/#{params[:professor_id]}"
  end
end
