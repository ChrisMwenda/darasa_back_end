class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :create_error
  
    # get all reviews
    def index
      reviews = Review.all
      render json: reviews
    end
  
    # GET /reviews/:id
    def show
      reviews = find_review
      render json: reviews
    end
    
    # delete Review
    def destroy
        review = find_review
        review.destroy
        head :no_content
    end
    
    # create Review
    # def create
    #   review = Review.create!(review_params)
    #   render json: review,  status: 201
    # end
  
    def new
      if logged_in? 
        if @beer = Beer.find_by_id(params[:beer_id])
          @review = @beer.reviews.build
        else
          @review = Review.new 
        end
      else
        redirect_if_not_logged_in
      end
    end
  
    def create  
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@review)
      else 
        render :new 
      end 
    end 
    private 
  
    def find_review
      Review.find(params[:id])
    end
    
    def render_not_found_response
      render json: { error: "Review not found" }, status: 404
    end
  
    def create_error
      render json: { error:  ["validation errors"]}, status: 422
    end
  
    def review_params
      params.permit(:price, :review_id, :teacher_id)
    end
end
