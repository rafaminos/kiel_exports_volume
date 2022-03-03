library(readr)
library(lubridate)
library(tidyverse)
library(xts)


df_exports <- read_csv("https://corona-datenmonitor-ifw-kiel.de/schiffe/Kiel%20Trade%20Indicator%20Exports.csv", 
                       skip = 9)
head(df_exports)
subset_exports_russia <- df_exports %>%
  filter(Country == "Russian Federation") %>%
  mutate(date = paste(paste(year,month,sep="-"),15,sep="-")) %>%
  select(date,Nowcast_5)


subset_exports_russia_xts <- xts(subset_exports_russia$Nowcast_5,order.by = ymd(subset_exports_russia$date))
plot(subset_exports_russia_xts)

