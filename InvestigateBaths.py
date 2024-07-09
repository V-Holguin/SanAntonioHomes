# Import libraries
import pandas as pd
import matplotlib.pyplot as plt

# Read CSV file into a DataFrame
df = pd.read_csv('filepath', sep=';')

filtered_df = df[df['Bathrooms'].between(5,8)]

# Create a scatter plot
plt.scatter(filtered_df['Bathrooms'], filtered_df['Price'])
plt.xlabel('Price')
plt.ylabel('Bedrooms')
plt.title('Scatter Plot: Bathrooms vs. Price')

# Show the plot
plt.show()
