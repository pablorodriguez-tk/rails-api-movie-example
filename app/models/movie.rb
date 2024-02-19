# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  gender        :string
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
class Movie < ApplicationRecord
  belongs_to :director, class_name: 'User'

  has_many :actors_movies
  has_many :users, through: :actors_movies

  has_one :source

  before_save :downcase_gender

  def as_json(options = {})
    super(include: :actors_movies)
  end

  private
  def downcase_gender
    self.gender = gender.downcase if gender.present?
  end

end
