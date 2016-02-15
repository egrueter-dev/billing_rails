class AddStripeKeysToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :publishable_key, :string
    add_column :users, :secret_key, :string
  end
end
