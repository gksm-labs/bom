# == Schema Information
#
# Table name: registrations
#
#  id            :bigint           not null, primary key
#  birth_date    :date             not null
#  category      :string           not null
#  city          :string           not null
#  club          :string
#  discipline    :string           not null
#  email         :string           not null
#  first_name    :string           not null
#  gdpr_consent  :boolean          default(FALSE), not null
#  gender        :string           not null
#  last_name     :string           not null
#  phone         :string           not null
#  t_shirt_size  :string           not null
#  terms_consent :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
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
