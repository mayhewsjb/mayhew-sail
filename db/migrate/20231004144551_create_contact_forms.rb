class CreateContactForms < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :dealt_with

      t.timestamps
    end
  end
end
