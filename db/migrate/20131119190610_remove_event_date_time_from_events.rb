class RemoveEventDateTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :event_date, :date
    remove_column :events, :time, :string
  end
end
