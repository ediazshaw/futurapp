class AddPrivateToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :private, :boolean, default: true
  end
end
