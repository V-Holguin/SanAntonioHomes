# Import libraries
import pandas as pd

# Read CSV file into a DataFrame
df = pd.read_csv('filepath')

# Drop data not from Texas
df = df.dropna(subset=['State'])
df = df[df['State'] == 'TX']

# Drop data not from San Antonio
df = df.dropna(subset=['City'])
df = df[df['City'] == 'San Antonio']

# Drop unnecessary columns
columns_to_drop = ['RegionID', 'SizeRank', 'RegionType', 'StateName', 'Metro', 'CountyName']
df.drop(columns=columns_to_drop, inplace=True)

# Identify the columns that are not date columns
non_date_columns = ['RegionName', 'State', 'City']

# Melt the dataframe to transpose date columns
df_melted = pd.melt(df, id_vars=non_date_columns, var_name='Date', value_name='Value')

print(df_melted)

# Save the resulting dataframe to a new .csv file
df_melted.to_csv('filepath', index=False)
