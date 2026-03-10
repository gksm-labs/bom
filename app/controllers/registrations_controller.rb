class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
    @starting_step = 1
  end

  def create
    @registration = Registration.new(registration_params)

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

  def registration_params
    params.require(:registration).permit(
      :first_name, :last_name, :birth_date, :gender, :city,
      :phone, :email, :discipline, :category, :club, :t_shirt_size,
      :gdpr_consent, :terms_consent
    )
  end

  def calculate_starting_step(registration)
    err_keys = registration.errors.map(&:attribute)
    step1_fields = [ :first_name, :last_name, :birth_date, :email, :phone, :gender, :city ]
    step2_fields = [ :discipline, :category, :t_shirt_size, :club ]

    if err_keys.intersect?(step1_fields)
      1
    elsif err_keys.intersect?(step2_fields)
      2
    else
      3
    end
  end
end
