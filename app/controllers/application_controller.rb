# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!, unless: :devise_controller? # Access sign in page, without already being signed in
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller? # reminds developer to authorize method using Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    skip_authorization # allows anyone to reach the index page. Will be overriden once Devise is implemented
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end

  private

  def user_not_authorized
    flash[:alert] =
      "You are not authorized to perform this action.
        Please speak to your supervisior about upgrading your account role."
    redirect_to(request.referer || quizzes_path)
  end
end
