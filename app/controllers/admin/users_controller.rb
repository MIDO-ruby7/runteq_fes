class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(id: :asc)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('defaults.message.success')
    else
      flash.now[:warning] = t('defaults.message.fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :graduating_class, :role)
  end
end
