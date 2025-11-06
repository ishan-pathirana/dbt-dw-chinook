SELECT
    MediaTypeId    AS media_type_id,
    Name           AS media_type_name,
    SYSDATE()      AS insertion_timestamp 
FROM
    {{ source('chinook', 'mediatype') }} AS media_type    
