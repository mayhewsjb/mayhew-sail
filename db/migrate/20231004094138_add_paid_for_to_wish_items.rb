class AddPaidForToWishItems < ActiveRecord::Migration[7.0]
  def change
    add_column :wish_items, :paid_for, :boolean
  end
end
