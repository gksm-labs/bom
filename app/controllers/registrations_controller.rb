class RegistrationsController < ApplicationController
  before_action :ensure_registration_open

  def new
    @registration = current_edition.registrations.build
    @starting_step = 1
  end

  def create
    @registration = current_edition.registrations.build(registration_params)

    if @registration.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Úspešne zaregistrovaný!" }
      end
    else
      @starting_step = calculate_starting_step(@registration)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ensure_registration_open
    unless current_edition&.registration_open?
      @registration = Registration.new
      @registration_closed = true
      render :new, status: :forbidden
    end
  end

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :birth_date, :gender, :city,
      :phone, :email, :discipline, :club, :t_shirt_size,
      :gdpr_consent, :terms_consent
    )
  end

  def calculate_starting_step(registration)
    err_keys = registration.errors.attribute_names

    return 1 if (err_keys & [ :first_name, :last_name, :birth_date, :email, :phone, :gender, :city ]).any?
    return 2 if (err_keys & [ :discipline, :t_shirt_size, :club ]).any?
    3
  end
end
