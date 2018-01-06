json.extract! song, :id, :title
json.url artist_song_url(song, :title, format: :json)
