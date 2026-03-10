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
require "test_helper"

class ScheduleItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
