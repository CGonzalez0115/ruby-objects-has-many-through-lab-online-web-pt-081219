class Artist
  attr_accessor :name, :artist, :genre

  ALL = []
  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def new_song(name, genre)
    song = Song.new(name, self, genre)
    self.songs.last
  end
end
