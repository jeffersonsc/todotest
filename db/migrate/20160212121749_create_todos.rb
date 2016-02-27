class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id, index: true
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
