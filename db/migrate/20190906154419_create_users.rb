class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :age
      t.string :email_address
      t.string :password_digest

      t.timestamps
    end
  end
end
