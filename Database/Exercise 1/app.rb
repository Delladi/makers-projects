# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
albums_repository = AlbumsRepository.new

albums_repository.all.each do |album|
  p album
end