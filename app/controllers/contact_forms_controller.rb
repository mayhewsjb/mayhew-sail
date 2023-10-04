# app/controllers/contact_forms_controller.rb
class ContactFormsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.save
      redirect_to new_contact_form_path, notice: 'Thank you for your message. We will get back to you soon!'
    else
      render :new
    end
  end

  def admin_index
    @contact_forms = ContactForm.all
  end

  def update
    @contact_form = ContactForm.find(params[:id])
    if @contact_form.update(contact_form_params)
      redirect_to admin_index_contact_forms_path, notice: 'Update successful.'
    else
      redirect_to admin_index_contact_forms_path, alert: 'Update failed.'
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message, :dealt_with)
  end
end
