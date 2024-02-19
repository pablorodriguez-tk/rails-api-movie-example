# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


MoviesUser.delete_all
Source.delete_all
Movie.delete_all
User.delete_all

user1 = User.create(name: 'John Doe', document: '11111111', document_type: :ci, birthday: Date.new(1990, 1, 1))
user2 = User.create(name: 'Jane Smith', document: '9876543', document_type: :dni, birthday: Date.new(1985, 5, 15))
user3 = User.create(name: 'John Smith 2', document: '12345678', document_type: :passport, birthday: Date.new(1975, 12, 31))
user4 = User.create(name: 'Jane Alos', document: '87654321', document_type: :dni, birthday: Date.new(1980, 6, 30))
user5 = User.create(name: 'John Johnson', document: '12345678', document_type: :passport, birthday: Date.new(1975, 12, 31))
user6 = User.create(name: 'Jane Milag', document: '87654321', document_type: :dni, birthday: Date.new(1980, 6, 30))
user7 = User.create(name: 'John Smith 3', document: '12345678', document_type: :passport, birthday: Date.new(1975, 12, 31))

movie1 = Movie.create(title: 'The Matrix', gender: 'Action', release_date: Date.new(1999, 3, 31), qualification: 8, director: user1)
movie2 = Movie.create(title: 'Inception', gender: 'Thriller', release_date: Date.new(2010, 7, 16), qualification: 9, director: user2)
movie3 = Movie.create(title: 'The Dark Knight', gender: 'Action', release_date: Date.new(2008, 7, 18), qualification: 9, director: user2)
movie4 = Movie.create(title: 'The Shaw', gender: 'romance', release_date: Date.new(2010, 7, 16), qualification: 9, director: user5)
movie5 = Movie.create(title: 'Winning', gender: 'drama', release_date: Date.new(2008, 7, 18), qualification: 9, director: user6)
movie6 = Movie.create(title: 'Anomalies', gender: 'comedy', release_date: Date.new(2010, 7, 16), qualification: 9, director: user7)

# add on table actors_movies
user1.movies << movie1
user1.movies << movie2
user2.movies << movie2
user2.movies << movie3
user5.movies << movie4
user6.movies << movie5
user7.movies << movie6

Source.create(format: 'DVD', path: '/path/to/dvd', duration: '2h 30m', movie: movie1)
Source.create(format: 'Blu-ray', path: '/path/to/blu-ray', duration: '2h 15m', movie: movie2)
Source.create(format: 'VHS', path: '/path/to/vhs', duration: '2h 30m', movie: movie3)
Source.create(format: 'DVD', path: '/path/to/dvd', duration: '2h 30m', movie: movie4)
Source.create(format: 'Blu-ray', path: '/path/to/blu-ray', duration: '2h 15m', movie: movie5)
Source.create(format: 'VHS', path: '/path/to/vhs', duration: '2h 30m', movie: movie6)
