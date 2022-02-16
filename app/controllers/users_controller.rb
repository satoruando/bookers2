class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
  end

  def edit
  end
end
