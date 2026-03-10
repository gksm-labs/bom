# == Schema Information
#
# Table name: events
#
#  id                     :bigint           not null, primary key
#  date                   :datetime
#  max_capacity           :integer
#  name                   :string
#  registration_ends_at   :datetime
#  registration_starts_at :datetime
#  year                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_events_on_year  (year) UNIQUE
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
