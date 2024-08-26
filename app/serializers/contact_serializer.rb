class ContactSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :first_name, :last_name, :phone, :color, :is_favorite, :contact_image

  def contact_image
    if object.contact_image.attached?
      rails_blob_url(object.contact_image)
    end
  end
end
