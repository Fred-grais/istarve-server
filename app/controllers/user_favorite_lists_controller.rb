class UserFavoriteListsController < ApplicationController
  before_action :set_user_favorite_list, only: [:show, :edit, :update, :destroy]

  # GET /user_favorite_lists
  # GET /user_favorite_lists.json
  def index
    @user_favorite_lists = UserFavoriteList.all
  end

  # GET /user_favorite_lists/1
  # GET /user_favorite_lists/1.json
  def show
  end

  # GET /user_favorite_lists/new
  def new
    @user_favorite_list = UserFavoriteList.new
  end

  # GET /user_favorite_lists/1/edit
  def edit
  end

  # POST /user_favorite_lists
  # POST /user_favorite_lists.json
  def create
    @user_favorite_list = UserFavoriteList.new(user_favorite_list_params)

    respond_to do |format|
      if @user_favorite_list.save
        format.html { redirect_to @user_favorite_list, notice: 'User favorite list was successfully created.' }
        format.json { render :show, status: :created, location: @user_favorite_list }
      else
        format.html { render :new }
        format.json { render json: @user_favorite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favorite_lists/1
  # PATCH/PUT /user_favorite_lists/1.json
  def update
    respond_to do |format|
      if @user_favorite_list.update(user_favorite_list_params)
        format.html { redirect_to @user_favorite_list, notice: 'User favorite list was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_favorite_list }
      else
        format.html { render :edit }
        format.json { render json: @user_favorite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favorite_lists/1
  # DELETE /user_favorite_lists/1.json
  def destroy
    @user_favorite_list.destroy
    respond_to do |format|
      format.html { redirect_to user_favorite_lists_url, notice: 'User favorite list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favorite_list
      @user_favorite_list = UserFavoriteList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_favorite_list_params
      params.require(:user_favorite_list).permit(:user_id, :restaurant_id)
    end
end
