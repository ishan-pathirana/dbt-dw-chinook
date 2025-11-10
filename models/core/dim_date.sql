WITH date_numbers AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY SEQ4()) - 1 AS day_num
    FROM TABLE(GENERATOR(ROWCOUNT => 6939))  -- ~19 YEARS OF DATES
),
date_spine AS (
    SELECT 
        DATEADD(DAY, day_num, '2009-01-01'::DATE) AS FULL_DATE
    FROM date_numbers
    WHERE DATEADD(DAY, day_num, '2009-01-01'::DATE) <= '2027-12-31'
)

SELECT
    -- PRIMARY KEY
    TO_CHAR(full_date, 'YYYYMMDD')                    AS date_id,

    -- BASE DATE
    full_date,

    -- CALENDAR BREAKDOWNS
    YEAR(full_date)                                  AS year,
    (YEAR(full_date) * 100 + WEEKOFYEAR(full_date)) AS year_week,
    DAYOFYEAR(full_date)                             AS year_day,
    MONTH(full_date)                                 AS month,
    MONTHNAME(full_date)                             AS month_name,
    DAYNAME(FULL_DATE)                               AS day_name,      -- e.g. 'Monday', 'Tuesday'
    DAYOFWEEKISO(FULL_DATE)                          AS week_day_num,   -- 1 = Monday, 7 = Sunday

    -- FISCAL DETAILS (FISCAL YEAR SAME AS CALENDAR YEAR)
    YEAR(full_date)                                  AS fiscal_year,
    CONCAT('Q', QUARTER(full_date))                  AS fiscal_qtr

FROM date_spine
ORDER BY full_date