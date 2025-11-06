SELECT 
    TrackId         AS track_id,
    Name            AS name,
    AlbumId         AS album_id,
    MediaTypeId     AS media_type_id,
    GenreId         AS genre_id,
    Composer        AS composer,
    Milliseconds    AS milliseconds,        
    Bytes           AS bytes,
    UnitPrice       AS unit_price,
    SYSDATE()       AS insertion_timestamp
FROM    
    {{ source('chinook', 'track') }} AS track