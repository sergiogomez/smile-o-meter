class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_column :users, :password_digest, :string

    add_index :users, :authentication_token, unique: true
  end
end
