class AddEventNameToVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :event_name, :string
  end
end
