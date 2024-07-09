# Import libraries
import pandas as pd

# Read CSV file into a DataFrame
df = pd.read_csv('filepath', sep=';')

filtered_df = df[df['Bedrooms'] == 7]
print(filtered_df)

"" prints the following:
                                      Location    Price  Bedrooms  Bathrooms  \
31       2 ADMIRALS WAY, San Antonio, TX 78257  5995000         7          1   
134       9235 Lasswell, San Antonio, TX 78211   269900         7          3   
247  311 W ROSEWOOD AVE, San Antonio, TX 78212  1649000         7          5   
664         440 KOPPLOW, San Antonio, TX 78221   500000         7          3   

      SqFt                                               Link  \
31   11932  https://www.zillow.com/homedetails/2-Admirals-...   
134   2647  https://www.zillow.com/homedetails/9235-Lasswe...   
247   3353  https://www.zillow.com/homedetails/311-W-Rosew...   
664   2847  https://www.zillow.com/homedetails/440-Kopplow...   

                                                 Image    Zip State  \
31   https://photos.zillowstatic.com/fp/5659d432ec3...  78257    TX   
134  https://photos.zillowstatic.com/fp/d8df623f5b1...  78211    TX   
247  https://photos.zillowstatic.com/fp/5659d432ec3...  78212    TX   
664  https://photos.zillowstatic.com/fp/5659d432ec3...  78221    TX   

            City             Address  
31   San Antonio      2 ADMIRALS WAY  
134  San Antonio       9235 Lasswell  
247  San Antonio  311 W ROSEWOOD AVE  
664  San Antonio         440 KOPPLOW  ""
