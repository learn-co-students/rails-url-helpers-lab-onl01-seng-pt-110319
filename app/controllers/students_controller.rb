class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]
  def index
    @students = Student.all
  end

  def show
    if @student.active == true
      @status = "This student is currently active."
    else
      @status="This student is currently inactive."
    end
  end

  def activate
    #@student=Student.find(params[:id])
    if @student.active == false
      @student.active=true
    else
      @student.active=false
    end
    @student.save
    redirect_to "/students/#{@student.id}"
  end


  private
    def set_student
      @student = Student.find(params[:id])
    end
end
