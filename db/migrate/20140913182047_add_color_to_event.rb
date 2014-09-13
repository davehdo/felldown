class AddColorToEvent < ActiveRecord::Migration
  def change
    add_column :events, :color, :string
    add_column :events, :notify, :boolean, default: true
  end
end
