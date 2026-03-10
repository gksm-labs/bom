# == Schema Information
#
# Table name: editions
#
#  id                     :bigint           not null, primary key
#  date                   :datetime         not null
#  entry_fee              :decimal(8, 2)    default(10.0)
#  max_capacity           :integer          default(500)
#  published              :boolean          default(FALSE), not null
#  registration_ends_at   :datetime
#  registration_starts_at :datetime
#  year                   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_editions_on_published  (published)
#  index_editions_on_year       (year) UNIQUE
#
class Edition < ApplicationRecord
  has_many :registrations, dependent: :restrict_with_error
  has_many :schedule_items, -> { order(:start_time) }, dependent: :destroy

  validates :year, :date, :max_capacity, presence: true
  validates :year, uniqueness: true

  def self.current
    where(published: true).where("date >= ?", Date.current).order(:date).first ||
      where(published: true).order(date: :desc).first
  end

  def registration_open?
    return false if capacity_reached?
    return false unless registration_starts_at && registration_ends_at

    Time.current.between?(registration_starts_at, registration_ends_at)
  end

  def capacity_reached?
    registrations.count >= max_capacity
  end

  def registered_count
    registrations.count
  end
end
