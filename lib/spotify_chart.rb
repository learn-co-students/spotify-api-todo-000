require 'json'
require 'open-uri'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    "http://charts.spotify.com/api/tracks/most_streamed/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  def get_first_track_info(music_hash)
  music_hash["tracks"][0]["track_name"]+" by "+music_hash["tracks"][0]["artist_name"]+" from the album "+music_hash["tracks"][0]["album_name"]  
  end


  def most_streamed(region)
    get_first_track_info(get_json(get_url(region)))
  end

end
