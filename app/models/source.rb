# == Schema Information
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  duration   :string
#  format     :string
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_sources_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
class Source < ApplicationRecord
  belongs_to :movie
end
