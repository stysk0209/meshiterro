class ApplicationController < ActionController::Base
#deviseを利用する機能（ユーザ登録、ログイン認証など）が実行される前に、configure_permitted_parametersが実行されます。
	 before_action :configure_permitted_parameters, if: :devise_controller?
	 before_action :authenticate_user!

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
