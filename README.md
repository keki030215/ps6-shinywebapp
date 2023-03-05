# ps6 User Documentation

#### ***Shiny Web Link:*** <https://keki030215.shinyapps.io/ps6-shinyweb/>

## Data Introduction

*The data set is from UAH.*

It includes four main variables: year, month, temperature, and region. Another variable called "time" is added during data analysis by mixing the year and month to calculate a relative time of the temperature.

The temperature measures are aggregated over a number of different regions, and the temperature data is temperature deviation (deg C) from 1978-2023 average.

## Widgets Explanation

**In the "*Plot*" page, there are three widgets.**

The first widget can change the color palette that the scatter plot uses.

The second widget could select the year range of the data. It could change between year 1978 - 2023 to display data within the specific year range.

The last widget could select the region that user wants to see from the data.

**In the "*Table*" page, there is only one widget.**

The widget is used to display the average temperature based on the variable that user chooses. User can choose among year, month, and region.
