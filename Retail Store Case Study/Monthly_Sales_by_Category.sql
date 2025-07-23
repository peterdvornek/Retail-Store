SELECT
    storeid,
    category,
    TO_CHAR(date, 'yyyy-MM') AS sales_date,
    SUM(unitssold) AS units_sold
FROM
    salesdata
WHERE
    storeid = 'S001' AND
    date < '2024-01-01' OR
    date > '2024-01-31'
GROUP BY
    storeid,
    TO_CHAR(date, 'yyyy-MM'),
    category
ORDER BY
    storeid,    
    sales_date

