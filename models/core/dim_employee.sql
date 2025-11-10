SELECT
    employee_id,
    employee_first_name,
    employee_last_name,
    employee_title,
    employee_reports_to,
    employee_birth_date,
    employee_hire_date,
    employee_address,
    employee_city,
    employee_state,
    employee_country,
    employee_postal_code,
    employee_phone,
    employee_fax,
    employee_email,
    SYSDATE() AS insertion_timestamp
FROM
    {{ ref('stg_employee') }} AS employee