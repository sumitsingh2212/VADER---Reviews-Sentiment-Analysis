WITH top_products AS (
  SELECT ProductId
  FROM reviews_sentiment
  WHERE Time >= '2006-01-01'
  GROUP BY ProductId
  ORDER BY COUNT(*) DESC
  LIMIT 50
)
SELECT
  rs.ProductId,
  DATE_FORMAT(rs.Time, '%Y-%m-01') AS month_start,   -- use as Month in Tableau
  AVG(rs.Score)       AS avg_score,
  AVG(rs.compound)    AS avg_sentiment,
  COUNT(*)            AS review_count
FROM reviews_sentiment rs
JOIN top_products tp ON tp.ProductId = rs.ProductId
WHERE rs.Time >= '2006-01-01'
GROUP BY rs.ProductId, month_start
ORDER BY rs.ProductId, month_start;