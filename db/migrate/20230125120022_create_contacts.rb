class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :phone, default: ''
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
