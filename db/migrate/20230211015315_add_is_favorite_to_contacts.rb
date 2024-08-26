class AddIsFavoriteToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :is_favorite, :boolean, default: false
  end
end
