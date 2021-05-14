# frozen_string_literal: true

class QuizPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  delegate :edit?, to: :user

  def create?
    user.edit?
  end

  def update?
    user.edit?
  end

  def destroy?
    user.edit?
  end

  def view_answers?
    user.edit? or user.view?
  end
end
