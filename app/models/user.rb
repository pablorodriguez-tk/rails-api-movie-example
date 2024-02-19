# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  birthday      :date
#  document      :string
#  document_type :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'ci_uy'

class User < ApplicationRecord
  has_many :actors_movies
  has_many :movies, through: :actors_movies

  validates :name, presence: true
  validates :document, presence: true
  validates :document_type, presence: true
  validates :birthday, presence: true
  validate :check_ci_format
  validate :check_age

  enum document_type: [:ci, :dni, :passport, :other]

  def check_ci_format
    if document_type == "ci"
     unless CiUY.validate(document)
       errors.add(:document, "CI must be a valid Uruguayan document ID number")
     end
    end
  end

  def check_age
    if birthday.present? && birthday > 18.years.ago
      errors.add(:birthday, "You must be over 18 years old")
    end
  end
end
