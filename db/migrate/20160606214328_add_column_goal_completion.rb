class AddColumnGoalCompletion < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :boolean
  end
end
