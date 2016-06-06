class ReplaceColumns < ActiveRecord::Migration
  def change
    remove_column :goals, :completed
    remove_column :goals, :public
    add_column :goals, :completed, :boolean
    add_column :goals, :public, :boolean
  end
end
