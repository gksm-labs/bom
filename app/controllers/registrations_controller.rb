class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Úspešne zaregistrovaný!" }
      end
    else
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
end
