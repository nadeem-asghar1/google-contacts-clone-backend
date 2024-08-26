class AddInTrashToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :in_trash, :boolean, default: false
  end
end
