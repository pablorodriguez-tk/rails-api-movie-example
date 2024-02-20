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
class Movie < ApplicationRecord
  GENRES = ['action', 'drama', 'comedy', 'science_fiction', 'historical', 'horror', 'suspense', 'fantasy']
  validates :genre, presence: true, inclusion: {in: GENRES}

  belongs_to :director, class_name: 'User'
  has_and_belongs_to_many :actors, class_name: 'User'
  has_one :source

  before_save :downcase_genre

  scope :by_genre, ->(genre) {where("lower(genre) = ?", genre.downcase)}
  scope :action, -> { by_genre('action')}
  scope :drama, -> { by_genre('drama')}
  scope :comedy, -> { by_genre('comedy')}
  scope :science_fiction, -> { by_genre('science_fiction')}
  scope :historical, -> { by_genre('historical')}
  scope :horror, -> { by_genre('horror')}
  scope :suspense, -> { by_genre('suspense')}
  scope :fantasy, -> { by_genre('fantasy')}

  def as_json(options = {})
    super(include: :actors)
  end

  private
  def downcase_genre
    self.genre = genre.downcase if genre.present?
  end

end
