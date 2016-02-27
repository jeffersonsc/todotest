class AddFinalizeAndPriorityToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :finalized, :boolean
    add_column :todos, :priority, :integer
  end
end
