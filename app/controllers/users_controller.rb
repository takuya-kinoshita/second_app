class UsersController < ApplicationController


  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規ユーザーを登録しました"
      redirect_to user_url(@user)
    else
      flash[:danger] = "登録に失敗しました"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    #debugger
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
