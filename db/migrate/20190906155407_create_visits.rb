class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :user_brew_queue, null: false, foreign_key: true
      t.date :visit_date
      t.string :event_name

      t.timestamps
    end
  end
end
