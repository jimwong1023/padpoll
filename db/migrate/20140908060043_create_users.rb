class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :oauth_token
      t.datetime :oauth_expires

      t.timestamps
    end
    add_index :users, [:email],  unique: true
    add_index :users, [:oauth_token]
  end
end
