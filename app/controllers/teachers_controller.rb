class TeachersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
       # GET all /Teachers
    def index
      teacher = Teacher.all
      render json: teacher
    end
  
    # GET /Teacher/:id
    def show
      teacher = find_teacher
      render json: teacher, include: :students
    end
  
    # # create Teacher
    # def create
    #   teacher = Teacher.create!(teacher_params)
    #   render json: teacher,  status: 201
    # end
  
    # # destroy Teacher
    # def destroy
    #   teacher = find_teacher
    #   teacher.destroy
    #   head :no_content
    # end
  
    private 
  
    def find_teacher
      Teacher.find(params[:id])
    end
    
    def render_not_found_response
      render json: { error: "Teacher not found" }, status: 404
    end
  
    def create_error
      render json: { error:  ["validation errors"]}, status: 422
    end
  
    # def teacher_params
    #   params.permit(:name, :address)
    # end
end
