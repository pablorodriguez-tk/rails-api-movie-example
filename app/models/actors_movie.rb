# == Schema Information
#
# Table name: actors_movies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_actors_movies_on_movie_id  (movie_id)
#  index_actors_movies_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#
class ActorsMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
