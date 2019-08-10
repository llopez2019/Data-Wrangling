library(dplyr)
library(tidyr)



df_original <- read.csv("YouTube.csv")
glimpse(df)

#Data Wrangling
df <- df_original[c(-1,-4,-5,-6,-7,-12,-13,-14,-15,-16)]
glimpse(df)
nrow(df)

#removing na
df[df == 0] <- NA
df <- na.omit(df)



#Mean of Views
mean(df$views)


#Summary of Views
summary(df$views)

#Filter to include only views with more that 148818 views as indicated by the mean of the first quartile.
#filters(df)[["views"]] <- ds$gender == "Male" & ds$age < 30
df_1<-df %>% filter(views>=148818)

#Summary of Views for Filtered Data
summary(df_1$views)


#Since the video with the lowest number of views is 148823 and the hihest is more than 137 M.  A popularity index is added to determine if a video is highly popular or just popular. 
df_1$Popularity_Index <- ifelse(( df_1$views >= 586076), '1', '0')


write.csv(df_1, file = "df_1clean.csv")
