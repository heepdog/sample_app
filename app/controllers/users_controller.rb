class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
   #@user = User.new(params[:user])
   @user = User.new(user_params)
   #@user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
   #@user = User.new(params.permit(:user, :name, :email, :password, :password_confirmation))
    if @user.save
      
    else
    render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

end
