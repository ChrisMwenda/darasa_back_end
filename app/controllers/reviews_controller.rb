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
    
    create Review
    def create
      review = Review.create!(review_params)
      render json: review,  status: 201
    end

end
