class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :age, :name, :city_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :age, :name, :current_password, :city_id)
  end
end