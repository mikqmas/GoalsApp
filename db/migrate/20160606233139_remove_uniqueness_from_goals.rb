class RemoveUniquenessFromGoals < ActiveRecord::Migration
  def change
    remove_index :goals, name: "index_goals_on_user_id"
  end
end
