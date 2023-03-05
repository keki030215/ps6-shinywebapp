# ps6 User Documentation

### ***Shiny Web Link:*** <https://keki030215.shinyapps.io/ps6-shinyweb/>

## Data Introduction

*The data set is from UAH.*

It includes four main variables: year, month, temperature, and region. Another variable called "time" is added during data analysis by mixing the year and month to calculate a relative time of the temperature.

The temperature measures are aggregated over a number of different regions, and the temperature data is temperature deviation (deg C) from 1978-2023 average.

## Panels And Widgets Explanation

#### **There are three panels.**

The first panel **Introduction** is a brief introduction about the data set.

The second panel **Plot** demonstrates the relationship between year 1978 - 2023 and temperature in different regions.

The third panel **Table** displays the average temperature based on different properties chose by the user through the widget.

#### **In the "*Plot*" panel, there are three widgets.**

The first widget can change the color palette that the scatter plot uses.

The second widget could select the year range of the data. It could change between year 1978 - 2023 to display data within the specific year range.

The last widget could select the region that user wants to see from the data.

#### **In the "*Table*" panel, there is only one widget.**

The widget is used to display the average temperature based on the variable that user chooses. User can choose among year, month, and region.
