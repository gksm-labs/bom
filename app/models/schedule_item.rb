# == Schema Information
#
# Table name: schedule_items
#
#  id          :bigint           not null, primary key
#  badge_color :string
#  description :text
#  start_time  :time
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  edition_id  :bigint           not null
#
# Indexes
#
#  index_schedule_items_on_edition_id  (edition_id)
#
# Foreign Keys
#
#  fk_rails_...  (edition_id => editions.id)
#
class ScheduleItem < ApplicationRecord
  belongs_to :edition

  validates :start_time, :title, presence: true

  enum :badge_color, { primary: "primary", red: "red", green: "green" }, default: :primary
end
