class HomesController < ApplicationController
  def create
    @home = Home.new(home_params)
    @home.home_id = current_user.id
      @home.save
      flash[:notice] = "Signed out successfully."
      redirect_to root
  end


  def top
  end

  def about
  end
end
