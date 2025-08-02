# amazon_forecast.py

import pandas as pd
from prophet import Prophet
import matplotlib.pyplot as plt

# Step 1: Load Historical Data
# Ensure your monthly_revenue.csv has columns: Month, Monthly_Revenue
df = pd.read_csv("monthly_revenue.csv")

# Rename columns as required by Prophet
df.rename(columns={"Month": "ds", "Monthly_Revenue": "y"}, inplace=True)

# Convert 'ds' to datetime
df['ds'] = pd.to_datetime(df['ds'])

# Step 2: Initialize Prophet Model
model = Prophet(yearly_seasonality=True, daily_seasonality=False)
model.fit(df)

# Step 3: Create Future DataFrame for 12 months
future = model.make_future_dataframe(periods=12, freq='M')

# Step 4: Forecast
forecast = model.predict(future)

# Step 5: Save Forecast to CSV
forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].to_csv("forecast.csv", index=False)

# Step 6: Plot Forecast
fig1 = model.plot(forecast)
plt.title("Amazon Sales Forecast (Next 12 Months)", fontsize=16)
plt.xlabel("Date")
plt.ylabel("Revenue")
plt.show()

# Step 7: Plot Components (Trend, Seasonality)
fig2 = model.plot_components(forecast)
plt.show()

print("Forecast completed! File saved as forecast.csv")
