class AddTableToGuestUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :guest_users, :post_id, :integer
  end
end
