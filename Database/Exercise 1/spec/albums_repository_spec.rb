# EXAMPLE

# file: spec/student_repository_spec.rb
require 'albums_repository'
def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumsRepository do
  before(:each) do 
    reset_albums_table
  end
  it 'returns all information in table' do 
    repo = AlbumsRepository.new
    albums = repo.all
    expect(albums.length).to eq 2
    
    expect(albums[0].id).to eq '1' 
    expect(albums[0].title).to eq 'Doolittle'
    expect(albums[0].release_year).to eq '1989'
  end
  
  # (your tests will go here).
end