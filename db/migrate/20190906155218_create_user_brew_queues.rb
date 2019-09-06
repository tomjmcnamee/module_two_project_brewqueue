class CreateUserBrewQueues < ActiveRecord::Migration[6.0]
  def change
    create_table :user_brew_queues do |t|
      t.references :brewery, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :interested_in
      t.boolean :favorite

      t.timestamps
    end
  end
end
