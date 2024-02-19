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
  has_and_belongs_to_many :movies, class_name: 'Movie'

  validates :name, presence: true
  validates :document, presence: true
  validates :document_type, presence: true
  validates :birthday, presence: true
  validate :check_ci_format
  validate :check_age

  enum document_type: [:ci, :dni, :passport, :other]

  def as_json(options = {})
    super(include: :movies)
  end

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
