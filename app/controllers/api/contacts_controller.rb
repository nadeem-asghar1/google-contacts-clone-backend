module Api
  class ContactsController < ApplicationController
    def index
      contacts = current_user.contacts.untrashed_contacts.order(first_name: :asc)
      render json: contacts, status: 200
    end
  
    def create
      contact = current_user.contacts.new(contact_params)
      contact.contact_image.attach(params[:contact][:contact_image]) if params[:contact][:contact_image] != "null"
      
      contact.save!
      render json: contact, status: :created
    rescue ActiveRecord::RecordInvalid => e
      Rollbar.error(e)
      render json: e&.record&.errors&.messages, status: :unprocessable_entity
    end

    def move_to_trash
      contact = current_user.contacts.find(params[:id])
      contact.update!(in_trash: true)
      render json: contact, status: 200
    rescue StandardError => e
      Rollbar.error(e)
      render json: e, status: 500
    end

    def handle_favorites
      contact = current_user.contacts.find(params[:id])
      contact.update!(is_favorite: !contact.is_favorite)
      render json: contact, status: 200
    rescue StandardError => e
      Rollbar.error(e)
      render json: e, status: 500
    end

    def favorite_contacts
      favorite_contacts = current_user.contacts.untrashed_contacts.favorite_contacts
      render json: favorite_contacts, status: 200
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone, :color, :is_favorite)
    end
  end
end
