# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :option
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
