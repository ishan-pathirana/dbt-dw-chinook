SELECT 
    ArtistId      AS artist_id,
    Name          AS artist_name,
    SYSDATE()     AS insertion_timestamp
FROM    
    {{ source('chinook', 'artist') }} AS artist