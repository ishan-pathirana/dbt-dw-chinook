SELECT
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_company,
    customer_address,
    customer_city,
    customer_state,
    customer_country,
    customer_postal_code,
    customer_phone,
    customer_fax,
    customer_email,
    customer_support_rep_id,
    SYSDATE() AS insertion_timestamp
FROM 
    {{ ref('stg_customer') }} AS customer