# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validate :check_correct_is_unique  # checks there is only one true option

  def check_correct_is_unique
    errors.add(:correct, "Must have one correct option") if question.answers.map(&:correct).count {|correct|
                                                              correct == true
                                                            } != 1
  end
end
