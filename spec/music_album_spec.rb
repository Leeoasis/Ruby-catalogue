require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(Date.new(2020, 1, 1), false, true)
  end
  it 'takes three parameters and returns a MusicAlbum object' do
    expect(@music_album).to be_an_instance_of MusicAlbum
  end
  it 'should return true when calling can_be_archived? if the album is older than 10 years and is on Spotify' do
    expect(@music_album.can_be_archived?).to eq(false)
  end
end
