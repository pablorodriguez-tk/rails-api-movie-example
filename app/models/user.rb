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

class User < ApplicationRecord
  has_and_belongs_to_many :movies, class_name: 'Movie'

  validates :name, presence: true
  validates :document, presence: true
  validates :document_type, presence: true
  validates :birthday, presence: true
  validate :check_ci_format
  validate :check_age

  before_validation :normalize_document
  before_save :normalize_document_for_save

  enum document_type: [:ci, :dni, :passport, :other]

  def as_json(options = {})
    super(include: :movies)
  end

  def check_ci_format
    if document_type.to_sym == :ci
      errors.add(:document, "Invalid format for CI") unless validate_ci(document)
    end
  end

  def check_age
    if birthday > 18.years.ago
      errors.add(:birthday, "You must be over 18 years old")
    end
  end

  def normalize_document
    self.document = document.gsub(/[.-]/, '') if document.present?
  end

  def normalize_document_for_save
    normalize_document
  end

  def validate_ci(ci)
    ci_array = ci.chars.map(&:to_i)
    return false unless ci_array.length == 8
    sum = 0
    multipliers = [2, 9, 8, 7, 6, 3, 4]

    for i in 0..6
      sum += ci_array[i] * multipliers[i]
    end

    mod = sum % 10
    h = (10 - mod) % 10

    return h == ci_array.last
  end
end
