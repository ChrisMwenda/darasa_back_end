class StudentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
    #    # GET all /students
    # def index
    #   student = Student.all
    #   render json: student
    # end
  
    # # GET /students/:id
    # def show
    #   student = find_student
    #   render json: student, include: :teachers
    # end
 
    class StudentsController < ApplicationController
      before_action :logged_in?, only: [:show]
      before_action :authorized?, only: [:show]
    
      def new
        @student = Student.new
      end
    
      def create 
        @student = Student.create(student_params)
        if @student.save 
          session[:Student_id] = @Student.id
          redirect_to Student_path(@Student)
        else 
          render :new 
        end
      end
    
      def show
        @student = Student.find_by(id: params[:id])
        @reviews = @Student.reviews
      end
    
      private 
    
        def student_params 
          params.require(:Student).permit(:Studentname, :email, :password)
        end
    
    end

end
