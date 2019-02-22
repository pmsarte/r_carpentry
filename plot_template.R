#new script for graphing with ggplot
#created 22/02/2019
library("ggplot2") #this package has already been installed this morning 

# load data into gapminder 
gapminder <- read.csv("data/gapminder_data.csv",header=TRUE)

#visual inspect the data file 
view(gapminder)

#data subsetting, row 1, column 1 
gapminder[1,1]
#row 1
gapminder[1,]
#preview top few lines
head(gapminder)

#let's look at the middle
gapminder[900:905,]

# create new plot
ggplot(data = gapminder, aes(x= gdpPercap, y = lifeExp)) + geom_point() 
# data set we previous defined
# aes aesthetic properties
# geom_point() is a scatter plot 

# show how life expectancy has changed over time 
ggplot(data = gapminder, aes(x= year, y = lifeExp)) + geom_point() 

# modify code to color the points by continent column 
ggplot(data = gapminder, aes(x= year, y = lifeExp, col = continent)) + geom_point() 

# let's introduce layers, let's do line plots instead of scatter plots

ggplot(data = gapminder, aes(x = year, y = lifeExp, by=country, color = continent)) + geom_line() 


# add column of countries as characters, instead of factors
countries_character <- as.character(gapminder$country) 
gapminder2 <-cbind(gapminder,countries_character)

# try same plot, demonstrates it is the same, you don't need it to be a factor  

ggplot(data = gapminder2, aes(x = year, y = lifeExp, by=countries_character, color = continent)) + geom_line() 

# try line for each continent 

ggplot(data = gapminder2, aes(x = year, y = lifeExp, by=continent, color = continent)) + geom_line()

#theme changes background
ggplot(data=gapminder, aes(x=year,y=lifeExp, by=country,color=continent))+geom_line()+geom_point()+theme_bw()
