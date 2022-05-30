class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :theme
      t.text :comment
      t.timestamp :remember_date
      t.boolean :question_day

      t.timestamp :created_at
    end
  end
end
