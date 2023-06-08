require_relative '../music_album'
require_relative '../item'

describe MusicAlbum do
  music_album = MusicAlbum.new(1, '2020-01-01', true)
  context 'when initialized' do
    it 'has a publish date' do
      expect(music_album.publish_date).to eq('2020-01-01')
    end
    it 'has a spotify status' do
      expect(music_album.on_spotify).to eq(true)
    end
  end
  context 'when archived' do
    it 'should return false' do
      music_album2 = MusicAlbum.new(1, '2000-01-01', true)
      music_album2.move_to_archive
      expect(music_album2.archived).to be(true)
    end
  end
end
