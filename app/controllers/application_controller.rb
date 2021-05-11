# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  after_action :verify_authorized # reminds developer to authorize method using Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    skip_authorization # allows anyone to reach the index page. Will be overriden once Devise is implemented
  end

  def current_user
    {name: "Joe", role: "edit"}  # temporarily used to act as a user with Edit role
  end

  private

  def user_not_authorized
    flash[:alert] =
      "You are not authorized to perform this action.
        Please speak to your supervisior about upgrading your account's role."
    redirect_to(request.referer || quizzes_path)
  end
end
