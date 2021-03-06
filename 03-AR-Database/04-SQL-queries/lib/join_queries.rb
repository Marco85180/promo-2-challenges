require 'sqlite3'

# opens the database
DATABASE_PATH = "lib/db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute ("SELECT track.name, album.title, artist.name
  FROM track
  INNER JOIN album, artist
  ON track.albumId = album.albumId
  AND album.artistId = artist.artistId")
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  stat = db.execute("SELECT genre.name, COUNT(track.TrackId), (AVG (track.Milliseconds) /60000)
    FROM Track
    INNER JOIN Genre
    ON Genre.GenreId = Track.GenreId
    WHERE genre.name = '#{category}' ").flatten

  stats = {
    category: stat[0],
    number_of_songs: stat[1],
    avg_length: stat[2]
  }
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists


end

p stats_on(db,"Pop")