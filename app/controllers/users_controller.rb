class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new params[:user]
    if @user.save
      flash[:success] = t".flash"
      redirect_to @user
    else
      render "new"
    end
  end

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

  private

  def find_by
    @user = User.find_by id: params[:id]
    return if @user
      flash[:success] = t :not_flash
      redirect_to @user
  end

end
