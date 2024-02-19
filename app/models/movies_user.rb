# == Schema Information
#
# Table name: movies_users
#
#  movie_id :bigint           not null
#  user_id  :bigint           not null
#
class MoviesUser < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
