WITH reg_units_sold AS (
    SELECT
        storeid,
        region,
        category,
        EXTRACT(YEAR FROM date) AS sales_year,
        SUM(unitssold) AS units_sold
    FROM
        salesdata
    GROUP BY
        storeid,
        region,
        category,
        EXTRACT(YEAR FROM date)
)

SELECT
    storeid,
    region,
    category,
    SUM(CASE WHEN sales_year = 2022 THEN units_sold ELSE 0 END) AS units_sold_2022,
    SUM(CASE WHEN sales_year = 2023 THEN units_sold ELSE 0 END) AS units_sold_2023
FROM
    reg_units_sold
WHERE
    storeid = 'S001'
GROUP BY
    storeid,
    region,
    category
ORDER BY
    storeid,
    region