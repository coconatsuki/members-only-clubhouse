class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:id])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Secret House !"
      redirect_to @user
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit( :name, :email, :password,
                                  :password_confirmation)
  end
end
