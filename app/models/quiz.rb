# frozen_string_literal: true

class Quiz < ApplicationRecord
  has_many :questions

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
end
