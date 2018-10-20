require 'pry'

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

  def self.create_by_name(song_name)
    new_song = self.new #create/instatiate
    new_song.name = song_name #name new upon creation
    @@all << new_song #saves and shovels new named song into @@all
    new_song #return
  end

  def self.find_by_name(song_name) #find methods usually require iteration
    self.all.detect { |x| x.name == song_name} #passes a string and searches all for string
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name)
    self.create_by_name(song_name)
  end

  def self.alphabetical(song_name)
    @@all.sort_by!(song_name)
  end

  def self.new_from_filename(file_name)
    # self.new =
    # artist_name =
  end

  def self.create_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end
