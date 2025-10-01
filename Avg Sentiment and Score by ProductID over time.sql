WITH top_products AS (
  SELECT ProductId
  FROM reviews_sentiment
  WHERE Time >= '2006-01-01'
  GROUP BY ProductId
  ORDER BY COUNT(*) DESC
  LIMIT 50
)
SELECT
  DATE_SUB(DATE(rs.Time), INTERVAL DAYOFMONTH(rs.Time)-1 DAY) AS month_start,
  rs.ProductId,
  AVG(rs.Score) AS avg_score,
  AVG(rs.compound) AS avg_sentiment_raw,
  (2 * AVG(rs.compound) + 3) AS avg_sentiment_normalized, -- scaled to 1-5
  COUNT(*) AS review_count
FROM reviews_sentiment rs
JOIN top_products tp ON tp.ProductId = rs.ProductId
WHERE rs.Time >= '2006-01-01'
GROUP BY rs.ProductId, month_start
ORDER BY rs.ProductId, month_start;