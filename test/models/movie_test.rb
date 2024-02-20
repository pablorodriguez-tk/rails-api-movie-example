# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  genre         :string
#  qualification :integer
#  release_date  :date
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  director_id   :bigint
#
# Indexes
#
#  index_movies_on_director_id  (director_id)
#
# Foreign Keys
#
#  fk_rails_...  (director_id => users.id)
#
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
