# == Schema Information
#
# Table name: registrations
#
#  id            :bigint           not null, primary key
#  bib_number    :integer
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
#  edition_id    :bigint           not null
#
# Indexes
#
#  index_registrations_on_edition_id                 (edition_id)
#  index_registrations_on_edition_id_and_bib_number  (edition_id,bib_number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (edition_id => editions.id)
#
class Registration < ApplicationRecord
  belongs_to :edition

  enum :gender, { male: "M", female: "F" }, validate: true
  enum :discipline, { main_10km: "10km", hobby_5km: "5km" }, validate: true
  enum :t_shirt_size, { xs: "XS", s: "S", m: "M", l: "L", xl: "XL", xxl: "XXL" }, validate: true

  validates :first_name, :last_name, :birth_date,
            :city, :phone, :email,
            presence: true

  validates :gdpr_consent, :terms_consent,
            acceptance: true

  validate :edition_must_be_open_for_registration, on: :create

  before_validation :assign_category, if: -> { birth_date.present? && gender.present? && edition.present? }

  private

  def assign_category
    age = edition.date.year - birth_date.year
    prefix = gender == "male" ? "M" : "F"

    self.category = case age
    when 0..39  then "#{prefix}39"
    when 40..49 then "#{prefix}40"
    when 50..59 then "#{prefix}50"
    else             "#{prefix}60+"
    end
  end

  def edition_must_be_open_for_registration
    errors.add(:base, :registration_closed) unless edition&.registration_open?
  end
end
