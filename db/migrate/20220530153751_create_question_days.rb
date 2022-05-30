class CreateQuestionDays < ActiveRecord::Migration[6.1]
  def change
    create_table :question_days do |t|
      t.string :question
      t.string :theme
      t.timestamp :date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
