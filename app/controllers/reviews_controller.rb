class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.where(user: @user)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = User.find(params[:user_id])
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

    private

  def review_params
    params.require(:review).permit(:body)
  end
end
