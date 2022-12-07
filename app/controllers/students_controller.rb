class StudentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
       # GET all /students
    def index
      student = Student.all
      render json: student
    end
  
    # GET /students/:id
    def show
      student = find_student
      render json: student, include: :teachers
    end


end
