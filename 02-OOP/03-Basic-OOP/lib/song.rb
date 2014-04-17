class Song

  attr_reader(:counter, :title, :artist, :style, :album, :label, :year)
  attr_accessor(:lyrics)

  def initialize(title, artist, style, album, label, year)
    @title = title
    @artist = artist
    @album = album
    @style = style
    @label = label
    @year = year
    @listen = false
    @lyrics = ""
    @counter = 0
  end

  def play(loud, number_of_times)
    if loud
      number_of_times.times { say @lyrics.upcase }
    else
      number_of_times.times { puts @lyrics }
    end
    @counter += 1
  end
end

my_song = Song.new("Alice ça glisse", "Franky", :zouk, "Best of la fête", "Gwadaloupe", 1993)
puts "let's listen to #{my_song.title}, #{my_song.album}, it's #{my_song.style}!!!"

lyrics = "say `Alice ça glisse, au pays des merveilles, vas-y Franky c'est du savon de Marseille!!!`"
my_song.lyrics = lyrics

puts "Here the lyrics : #{my_song.lyrics}"

3.times do
  my_song.play(true, 4)
end

# Compter le nombre de fois que l'on a joué la chanson
p "This song was played : #{my_song.counter} times"
