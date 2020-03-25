class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def activate
    @student = Student.find_by(:id => params[:id])
    if @student.active == true
      @student.active = false
      @student.save
      redirect_to student_path
    else
      @student.active = true
      @student.save
      redirect_to student_path
    end
  end

  def show
    set_student
  end


  private

    def set_student
      @student = Student.find(params[:id])
    end
end