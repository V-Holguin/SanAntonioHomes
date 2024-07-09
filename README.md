# San Antonio Homes

- Used an online tool to scrape live data from Zillow, pulling 800 current listings in San Antonio.
- Wrote a Python script to load the .csv into a MySQL Workbench session [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/LoadScrapedDataIntoMySQL.py)
- Cleaned, reorganized, and formatted the data writing SQL queries [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/WrangleScrapedData.sql)
- Downloaded Zillow's historical data for 1 bedroom homes from their site.
- Wrote a Python script to load in the data, clean, organize, transpose, and export the data [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/OneBedroomDataCleaning.py)
- Loaded datasets into Tableau Desktop to create visuals and an interactive dashboard that made the data easy to understand [HERE](https://public.tableau.com/app/profile/vincent.holguin/viz/SanAntonioHomePrices/HomePrices)

## Insights
- Although data and recommendations would be specially aimed at what stakeholders have in mind in a real scenario, we can see some overall trends from the data. <br>
- The most dramatic story from the data is the massive spike in price when a home has 7 bedrooms, which drops back to near normal levels at 8 bedrooms.
  - Investigating that further [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/Investigate7Beds.py), we see that the average price is being skewed by a masssive 12,000 sq.ft. 7 bedroom home listed at $6 million.
- Moving onto bathrooms, we see 2 peaks in price occurring at 6 and 8 baths.
  - Investigating the peaks further [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/InvestigateBaths.py), we see a pretty smooth distribution peaking at 6 baths. This double peak shape is also seen to be formed by the scarcity of 8 bath homes, showing only 2 total listings with 8 baths, one of those being listed at over $3 million, bringing the average price up which can be seen on the scatter plot made [HERE](https://github.com/V-Holguin/SanAntonioHomes/blob/main/BathVsPrice.png).
- Finally, as expected, square footage and price have a strong positive correlation showing price increase as square footage increases.
- The future forecasts currently show a sustained drop in one bedroom home prices in the following year due to the recent decrease of those prices in 2024, with only zip code 78204 projected to increase during this time.

## Recommendations
- If we are taking the one bedroom home prices as a safe basis for the overall market (not recommended in a real scenario), the projected lowering of prices shows a homeowner should be looking to sell soon, while a potential buyer may benefit from waiting on a purchase.
- Furthermore, 5 and 6 seem to be the magic numbers for someone looking for a larger home.
  - The rise in price when a home goes from 5 to 6 bedrooms is extremely small. Meaning a buyer making a push towards 6 rooms instead of 5 may be getting a better value on a home, while a seller holding a 6 bedroom home may be at a disadvantage.
  - Opposite of bedrooms, we see a very dramatic spike in home price when bathrooms go from 5 to 6. This time it may be wise for a buyer to settle for 5 baths instead of 6 if they are looking to maximize value, while a seller may be in luck if currently holding a 6 bathroom home.
- On smaller and medium homes, we see a constant increase of price as bedrooms increase.
  - This is not reflected in bathrooms however, since going from 1 to 2 bathrooms actually shows an average decrease in price before going back up at 3 bathrooms. This again means a buyer may want to go for a 2 bedroom over 3 if they want a better value, while sellers holding a 2 bathroom home may be at a disadvantage.
