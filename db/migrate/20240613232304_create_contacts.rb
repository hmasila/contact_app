class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone

      t.timestamps
    end
  end
end
