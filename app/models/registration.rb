class Registration < ApplicationRecord
  validates :first_name, :last_name, :birth_date,
            :gender, :city, :phone, :email,
            :discipline, :category, :t_shirt_size, presence: true

  validates :gdpr_consent, :terms_consent, acceptance: true
end
