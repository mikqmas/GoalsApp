class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null:false
      t.boolean :public, null:false

      t.timestamps null: false
    end
  end
end
