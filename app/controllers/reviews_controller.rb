class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
    #GET /reviews
    def index
      reviews = User.find_by(id: session[:user_id]).reviews
      render json: reviews
    end

  #GET reviews/:id
    def show
      render json: find_review
    end

  #POST reviews/
    def create 
      review= User.find_by(id: session[:user_id]).reviews.create!(review_params)
      render json: review, status: :created
    end

   #DELETE reviews/:id
    def destroy
      review=find_review
      review.destroy
      head :no_content
    end
  
    #PATCH reviews/:id
    def update
        review=find_review
        review.update!(review_params)
        render json: review, status: :Accepted
    end
  
    private
    def find_review
      User.find_by(id: session[:user_id]).reviews.find(params[:id])
    end
  
    def render_not_found
      render json: {error: "Review not found"}, status: :not_found
    end
  
    def review_params
      params.permit(:model, :name, :image_url, :info)
    end
  
  end
