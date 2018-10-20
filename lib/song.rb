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
    self.all.detect{ |x| x.name == song_name} #passes a string and searches all song objects for a particular string
    # or
    # @@all.detect{ |x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || #evaluates left side and if false evaluates right side of OR
    self.create_by_name(song_name)
    # or below, but above is cleaner and DRY
    # if self.find_by_name(song_name)
    #   self.find_by_name(song_name)
    # else
    #   self.create_by_name(song_name)
    # end
  end

  def self.alphabetical
    # @@all.sort{ |a, b| a.name <=> b.name } #compare current and next and works its way through the array and sorts
    @@all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(filename)
    # "<Artist Name> - <Song Name>.mp3"
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    new_song = Song.new
    new_song.name = split_filename[1]
    new_song.artist_name = split_filename[0]
    new_song
  end

  def self.create_from_filename(filename) #class method should not only parse the filename correctly but should also save the Song instance that was created.
    # "<Artist Name> - <Song Name>.mp3"
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    new_song = Song.new
    new_song.name = split_filename[1]
    new_song.artist_name = split_filename[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
