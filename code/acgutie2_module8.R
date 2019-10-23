
#Clear workspace and variables and load packages
rm(list=ls(all=TRUE))
library(tidyverse)  
library(colorspace)

#load TV rating data from Tidy Tuesday 1/8/2019
tv_ratings <- read.csv("data/2019/2019-01-08/IMDB_Economist_tv_ratings.csv")

#filter data to show only wanted genre
tv_ratings%>%
  filter(title %in% c("CSI: Crime Scene Investigation", "Law & Order")) -> tv_ratings

#filter data into ymd 
tv_ratings %>%
  separate(date,
           into = c("year", "month", "day"),
           sep = "-" ) -> tv_ratings

tv_ratings%>%
  filter(year %in% c("2001","2002","2003","2004","2005","2006","2007","2008","2009","2010")) -> tv_ratings

tv_ratings %>%
  ggplot(mapping = aes(x = year, y= av_rating, group = title, fill = title))+
  geom_bar(position = "dodge", stat = "identity")+
  scale_fill_brewer(palette = "Set1")+
  xlab("Year")+
  ylab("Average Rating")+ 
  labs(fill = "Show Title")+
  labs(title = "Law & Order v. CSI \n Average Ratings 2001-2010")+
  theme(plot.title = element_text(hjust = 0.5),)
  
  
