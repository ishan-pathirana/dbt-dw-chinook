SELECT
    EmployeeId  AS employee_id,
    LastName    AS employee_last_name,          
    FirstName   AS employee_first_name,
    Title       AS employee_title,
    ReportsTo   AS employee_reports_to,
    BirthDate   AS employee_birth_date,
    HireDate    AS employee_hire_date,
    Address     AS employee_address,
    City        AS employee_city,
    State       AS employee_state,
    Country     AS employee_country,
    PostalCode  AS employee_postal_code,
    Phone       AS employee_phone,
    Fax         AS employee_fax,
    Email       AS employee_email,
    SYSDATE()   AS insertion_timestamp
FROM 
    {{ source('chinook', 'employee') }} AS employee