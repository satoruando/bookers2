class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "Signed in successfully."
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :root
    end
  end

  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = Book.all
  end

  def edit
    before_action :authenticate_user!, except: [:show, :index]
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
