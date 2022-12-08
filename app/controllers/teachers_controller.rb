class TeachersController < ApplicationController

    # # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # # rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
    # #    # GET all /Teachers
    # # def index
    # #   teacher = Teacher.all
    # #   render json: teacher
    # # end
  
    # # # GET /Teacher/:id
    # # def show
    # #   teacher = find_teacher
    # #   render json: teacher, include: :students
    # # end
  
    # # # create Teacher
    # # def create
    # #   teacher = Teacher.create!(teacher_params)
    # #   render json: teacher,  status: 201
    # # end
  
    # # # destroy Teacher
    # # def destroy
    # #   teacher = find_teacher
    # #   teacher.destroy
    # #   head :no_content
    # # end
  
    # private 
  
    # def find_teacher
    #   Teacher.find(params[:id])
    # end
    
    # def render_not_found_response
    #   render json: { error: "Teacher not found" }, status: 404
    # end
  
    # def create_error
    #   render json: { error:  ["validation errors"]}, status: 422
    # end
  
    # # def teacher_params
    # #   params.permit(:name, :address)
    # # end
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, except: [:index, :show]

  def search
    if params[:search].present?
      @teachers = Teacher.search(params[:search])   
    else
      @teachers = Teacher.all
    end
  end

  def index
    @teachers = Teacher.all
  end

  # GET /Teachers/1
  # GET /Teachers/1.json
  def show
    @reviews = Review.where(teacher_id: @teacher.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /Teachers/new
  def new
    @teacher = current_user.Teachers.build
  end

  # GET /Teachers/1/edit
  def edit
  end

  # POST /Teachers
  # POST /Teachers.json
  def create
    @teacher = current_user.teachers.build(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Teachers/1
  # PATCH/PUT /Teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(Teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Teachers/1
  # DELETE /Teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to Teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Teacher_params
      params.require(:Teacher).permit(:title, :description, :Teacher_length, :director, :rating, :image)
    end
end
