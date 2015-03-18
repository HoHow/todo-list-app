class AddCheckFieldToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :checked, :boolean
  end
end
