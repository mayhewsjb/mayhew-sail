class CreateWishItems < ActiveRecord::Migration[7.0]
  def change
    create_table :wish_items do |t|
      t.string :name
      t.decimal :price
      t.text :use

      t.timestamps
    end
  end
end
