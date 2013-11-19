class RemoveDateVarsFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :month, :integer
  	remove_column :events, :year, :integer
  	remove_column :events, :day, :integer
  end
end
