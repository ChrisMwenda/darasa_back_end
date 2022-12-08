class ReviewsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
    # # get all reviews
    # def index
    #   reviews = Review.all
    #   render json: reviews
    # end
  
    # # GET /reviews/:id
    # def show
    #   reviews = find_review
    #   render json: reviews
    # end
    
    # # delete Review
    # def destroy
    #     review = find_review
    #     review.destroy
    #     head :no_content
    # end
    
    # create Review
    # def create
    #   review = Review.create!(review_params)
    #   render json: review,  status: 201
    # end
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_teacher
    before_action :authenticate_student!
  
    # GET /reviews/new
    def new
      @review = Review.new
    end
  
    # GET /reviews/1/edit
    def edit
    end
  
    # POST /reviews
    # POST /reviews.json
    def create
      @review = Review.new(review_params)
      @review.student_id = current_student.id
      @review.teacher_id = @teacher.id
  
      if @review.save
        redirect_to @teacher
      else
        render 'new'
      end
    end
  
    # PATCH/PUT /reviews/1
    # PATCH/PUT /reviews/1.json
    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to @review, notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /reviews/1
    # DELETE /reviews/1.json
    def destroy
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_review
        @review = Review.find(params[:id])
      end
  
      def set_teacher
        @teacher = teacher.find(params[:teacher_id])
      end
  
      # Custom Params only.
      def review_params
        params.require(:review).permit(:title, :rating, :comment)
      end
end
