--Assumptions: Table: BusinessData(bu, month, cost, revenue)

SELECT 
  bu,
  month,
  ROUND(SUM(cost) / NULLIF(SUM(revenue), 0), 2) AS cost_to_revenue_ratio
FROM BusinessData
GROUP BY bu, month;
