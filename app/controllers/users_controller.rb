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
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    @users = User.new
  end
end
