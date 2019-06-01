class AddColumntoGroup < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :name, :string, null: false, unique: true
  end
end
