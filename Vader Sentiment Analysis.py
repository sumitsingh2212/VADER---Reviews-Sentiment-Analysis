import pandas as pd
import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer

INPUT_CSV = r"D:\Portfolio Projects Data\Reviews Sentiment Analysis\Reviews.csv"
OUTPUT_CSV = r"D:\Portfolio Projects Data\Reviews Sentiment Analysis\Reviews_with_VADER.csv"
CHUNK_SIZE = 50000 
TEXT_COLUMN = "Text"

try:
    nltk.data.find("sentiment/vader_lexicon.zip")
except LookupError:
    nltk.download("vader_lexicon", quiet=True)

analyzer = SentimentIntensityAnalyzer()

first_chunk = True
reader = pd.read_csv(INPUT_CSV, chunksize=CHUNK_SIZE, iterator=True)

for i, chunk in enumerate(reader, start=1):
    print(f"Processing chunk {i} rows={len(chunk)}")
    texts = chunk[TEXT_COLUMN].astype(str).tolist()
    scores = [analyzer.polarity_scores(t) for t in texts]
    sentiment_df = pd.DataFrame(scores, index=chunk.index)  # pos, neu, neg, compound

    # place sentiment columns to the left of original chunk
    out_chunk = pd.concat([sentiment_df, chunk], axis=1)

    # write header only for first chunk, then append
    if first_chunk:
        out_chunk.to_csv(OUTPUT_CSV, index=False, mode="w")
        first_chunk = False
    else:
        out_chunk.to_csv(OUTPUT_CSV, index=False, mode="a", header=False)

print("Done")