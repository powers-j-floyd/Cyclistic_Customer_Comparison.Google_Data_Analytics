# Cyclistic Customer Comparison - Google Data Analytics Capstone
This project is part of the Google Data Analytics Capstone project through Coursera. It analyzes customer ride patterns for the fictitious bike share company 'Cyclistic' to compare behavior between casual and member riders. In this scenario, insights from the project will be used to design a marketing strategy to convert casual riders into members. 

## Technologies Used
- BigQuery SQL (ETL/Data Integration)
- Tableau (Dashboard & Visual Analytics)

## Data Sources
The data for this project were sourced from the [Divvy bicycle sharing service](https://divvybikes.com/data-license-agreement), which is operated by Lyft Bikes and Scooters, LLC. 
The raw trip data can be accessed directly through the following [link to the zip files](https://divvy-tripdata.s3.amazonaws.com/index.html).

## Project Overview
This project analyzes 12 months of Cyclistic bike share data to compare how casual and member riders use the service. The analysis includes:
- Ride counts and frequencies
- Ride distance and duration
- Time of day and weekday usage
- Geographic location patterns

## Key Findings
- Casual riders make up 40% of total rides in summer but only 20% in winter.
- Members primarily use the service for commuting and ride more on weekdays.
- Casual riders use the service for leisure and ride more on weekends. 
- Riders travel similar average distances, but the average durations are shorter for members and longer for casual riders. 
- The top 50 starting locations for casual riders are located closer to the waterfront downtown.

## Tableau Visualizations

![Rides by Customer Type](4_Visualize/Rides%20by%20Customer%20Type.png)


![Rides by Weekday](4_Visualize/Rides%20by%20Weekday.png)
This visualization highlights how members ride more consistently on weekdays, while casual riders prefer weekends.




![Rides by Time](4_Visualize/Rides%20by%20Time.png)
This chart shows the distribution of rides by time of day for casual and member riders.




![Avg Distance Histogram](4_Visualize/Avg%20Distance%20Histogram.png)
This histogram illustrates the distribution of average ride distances for casual and member riders.




![Avg Duration Histogram](4_Visualize/Avg%20Duration%20Histogram.png)
This histogram illustrates the distribution of average ride durations for casual and member riders.




## Conclusion
This analysis provides valuable insights into how casual riders use Cyclistic services primarily for leisure during weekends, closer to the waterfront, and more frequently in the warmer months. Additionally, the data show that members tend to use Cyclistic services for commuting, with an average ride duration of 10-12 minutes during peak commute times. To convert casual riders into members, Cyclistic can target marketing efforts toward promoting commuting benefits during warmer months. Campaigns should highlight the convenience, health benefits, and environmental impact of cycling to work.

