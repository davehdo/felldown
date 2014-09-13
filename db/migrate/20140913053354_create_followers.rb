class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :name
      t.string :number
      t.string :email
      t.string :icon

      t.timestamps
    end
  end
end
