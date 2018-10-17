class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self 
  end
  
  def self.create
    new_song = self.new #create
    new_song.save #save
    new_song #return the object 
  end 
  
  def self.new_by_name(song_name)
    new_song = self.new #create 
    new_song.name = song_name #name 
    new_song #return 
  end 
  
  def self.create_by_name(song_name ) 
    new_song = self.new #create 
    new_song.name = song_name #name 
    song_name.save #return 
  end 
  
end