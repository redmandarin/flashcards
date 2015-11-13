class Dashboard::UsersController < Dashboard::BaseController
  def destroy
    current_user.destroy
    redirect_to login_path, notice: I18n.t("user_success_deletion")
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
