# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # アカウント編集の時にzipcode,address,profileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:zipcode, :address, :profile])
  end

end
