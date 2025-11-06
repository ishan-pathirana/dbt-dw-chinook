SELECT
    CustomerId      AS customer_id,
    FirstName       AS customer_first_name,    
    LastName        AS customer_last_name, 
    Company         AS customer_company,    
    Address         AS customer_address,
    City            AS customer_city,         
    State           AS customer_state,    
    Country         AS customer_country,
    PostalCode      AS customer_postal_code,
    Phone           AS customer_phone,
    Fax             AS customer_fax,
    Email           AS customer_email,
    SupportRepId    AS customer_support_rep_id,
    SYSDATE() AS insertion_timestamp
FROM
    {{ source('chinook', 'customer') }} AS customer