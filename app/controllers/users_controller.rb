class UsersController < ActionController::Base
  layout 'application'
  def index
    @presenter = Users::IndexPresenter.new(User.all)
  end

  def new
    @user = User.new
  end

  def create
    params.require(:user).permit(:name, :email)
    @user = User.create(params.require(:user).permit(:name, :email))
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update!(params.require(:user).permit(:name, :email))
  end

  def show
    @user = User.find(params[:id])
  end
end
