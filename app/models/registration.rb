class Registration < ApplicationRecord
  enum :gender, { male: "M", female: "F", unstated: "N" }, validate: true
  enum :discipline, { main_10km: "10km", hobby_5km: "5km" }, validate: true
  enum :category, { men: "M", women: "F" }, validate: true
  enum :t_shirt_size, { xs: "XS", s: "S", m: "M", l: "L", xl: "XL", xxl: "XXL" }, validate: true

  validates :first_name, :last_name, :birth_date,
            :city, :phone, :email,
            presence: true

  validates :gdpr_consent, :terms_consent,
            acceptance: true
end
