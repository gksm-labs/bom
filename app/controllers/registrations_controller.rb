class RegistrationsController < ApplicationController
  before_action :ensure_registration_open

  def new
    @registration = @current_edition.registrations.build
    @starting_step = 1
  end

  def create
    @registration = @current_edition.registrations.build(registration_params)

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
    unless @current_edition&.registration_open?
      @registration_closed = true
      @starting_step = 1
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
    err_keys = registration.errors.map(&:attribute)
    step1_fields = [ :first_name, :last_name, :birth_date, :email, :phone, :gender, :city ]
    step2_fields = [ :discipline, :t_shirt_size, :club ]

    if err_keys.intersect?(step1_fields)
      1
    elsif err_keys.intersect?(step2_fields)
      2
    else
      3
    end
  end
end
