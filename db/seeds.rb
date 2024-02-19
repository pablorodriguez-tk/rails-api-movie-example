# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


ActorsMovie.destroy_all
Source.destroy_all
Movie.destroy_all
User.destroy_all

user1 = User.create(name: 'John Doe', document: '11111111', document_type: :ci, birthday: Date.new(1990, 1, 1))
user2 = User.create(name: 'Jane Smith', document: '9876543', document_type: :dni, birthday: Date.new(1985, 5, 15))

movie1 = Movie.create(title: 'The Matrix', gender: 'Action', release_date: Date.new(1999, 3, 31), qualification: 8, director: user1)
movie2 = Movie.create(title: 'Inception', gender: 'Thriller', release_date: Date.new(2010, 7, 16), qualification: 9, director: user2)

# add on table actors_movies
user1.movies << movie1
user1.movies << movie2
user2.movies << movie2

Source.create(format: 'DVD', path: '/path/to/dvd', duration: '2h 30m', movie: movie1)
Source.create(format: 'Blu-ray', path: '/path/to/blu-ray', duration: '2h 15m', movie: movie2)
