class AddColorToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :color, :string, default: ''
  end
end
