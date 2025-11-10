SELECT
    track.track_id,
    track.name,
    composer,
    milliseconds,
    bytes,
    unit_price,
    album.album_id,
    album.album_title,
    artist.artist_id,
    artist.artist_name,
    genre.genre_id,
    genre.genre_name,
    media_type.media_type_id,
    media_type.media_type_name,
    SYSDATE() AS insertion_timestamp
FROM
    {{ ref('stg_track') }} AS track
    LEFT JOIN {{ ref('stg_genre') }} AS genre    
        ON track.genre_id = genre.genre_id
    LEFT JOIN {{ ref('stg_album') }} AS album
        ON track.album_id = album.album_id
    LEFT JOIN {{ ref('stg_artist') }} AS artist
        ON album.artist_id = artist.artist_id
    LEFT JOIN {{ ref('stg_media_type') }} AS media_type
        ON track.media_type_id = media_type.media_type_id