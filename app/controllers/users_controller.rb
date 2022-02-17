class UsersController < ApplicationController
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
