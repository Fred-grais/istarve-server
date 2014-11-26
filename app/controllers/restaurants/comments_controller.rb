class CommentsController < ApplicationController
  before_action :set_restaurant_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:index, :create]

  before_action :authenticate_user!
  # GET /restaurant_comments
  # GET /restaurant_comments.json
  def index
    @restaurant_comments = RestaurantComment.all
  end

  # GET /restaurant_comments/1
  # GET /restaurant_comments/1.json
  def show
  end

  # GET /restaurant_comments/new
  def new
    @restaurant_comment = RestaurantComment.new
  end

  # GET /restaurant_comments/1/edit
  def edit
  end

  # POST /restaurant_comments
  # POST /restaurant_comments.json
  def create
    @restaurant_comment = RestaurantComment.new(restaurant_comment_params)

    respond_to do |format|
      if @restaurant_comment.save
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_comment }
      else
        format.html { render :new }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_comments/1
  # PATCH/PUT /restaurant_comments/1.json
  def update
    respond_to do |format|
      if @restaurant_comment.update(restaurant_comment_params)
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_comment }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_comments/1
  # DELETE /restaurant_comments/1.json
  def destroy
    @restaurant_comment.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_comments_url, notice: 'Restaurant comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_comment
      @restaurant_comment = RestaurantComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_comment_params
      params.require(:restaurant_comment).permit(:title, :body)
    end
end
