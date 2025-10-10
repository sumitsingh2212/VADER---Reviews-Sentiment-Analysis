# VADER Reviews Sentiment Analysis  

This project applies **VADER (Valence Aware Dictionary and sEntiment Reasoner)** to analyze customer reviews and visualize insights for business decision-making.  

---

### Methodology 
- **Step 1 (Python):** Performed VADER sentiment analysis on the dataset and created a merged CSV file as an output
- **Step 2 (SQL):** Aggregated the data by ProductID and Month for easy processing in Tableau and normalised the Compound sentiment from (-1 to 1) to (1 to 5) for comparison with User Ratings
- **Step 3 (Tableau):** Created an interactive dashboard to capture relevant insights [public.tableau.com/app/profile/sumit.singh4638/viz/VaderSentimentAnalysis/Dashboard1](https://public.tableau.com/app/profile/sumit.singh4638/viz/VaderSentimentAnalysis/Dashboard1)

---

## Data being captured
- Avg Sentiment vs Avg User Score
- Review count over time
- Both the above can be filtered using ProductID

---

## Insights gained
- Weakness - Product lines where the Avg User Score is higher than the Avg Sentiment
- Opportunity - Product lines where the Avg Sentiment is greater than Avg User Score, here the Avg User score could go one point higher by making a few changes

---

## Constraints
- Top 50 products with the highest review count are considered
- Reviews after '2006-01-01' are taken into account 

---

## Dataset  
Full dataset (~300 MB) available at: [sumitsingh.info/dataset/vader-reviews](https://sumitsingh.info/dataset/vader-reviews)

---

## In the Repository
- Python File used to perform VADER Analysis on the dataset
- SQL File used to aggregate by ProductID and Months and normalise the Compund Sentiment
- Excel file exported from SQL
