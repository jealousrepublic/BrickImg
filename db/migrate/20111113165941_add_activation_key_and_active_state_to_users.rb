class AddActivationKeyAndActiveStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_state, :bool
    add_column :users, :activation_key, :string
  end
end
