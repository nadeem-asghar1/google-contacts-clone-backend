class Contact < ApplicationRecord
  belongs_to :user

  scope :untrashed_contacts, -> { where(in_trash: false) }
  scope :favorite_contacts, -> { where(is_favorite: true) }

  has_one_attached :contact_image
end
