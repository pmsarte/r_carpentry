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


# draw points on top of lines, black colour for points, only lines' colours are now based on continent  
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) + geom_line(aes(color=continent)) + geom_point()  

# change colour of all lines to blue (remove aes)
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) + geom_line(color="blue") + geom_point() 

# switch order of point and line layers from previous example 
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country))+ geom_point() + geom_line(color="purple")

# statistical models

ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point()

# use scale function (change x axis)
# alpha function (transparency)
# changes each 1 unit on x-scale to be a factor of 10 
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp,color=continent)) + geom_point(alpha = 0.5) + scale_x_log10()

# geom_smooth 
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp,color=continent)) + geom_point(alpha=0.5) + scale_x_log10()+
  geom_smooth(method="lm")

# make line thicker 
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp,color=continent)) 
+ geom_point(alpha=0.5) 
+ scale_x_log10()
+ geom_smooth(method="lm",size=1.5)

#modify shape and size of points on the point layer in the previous example 
test_plot_2<-ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp,color=continent)) + 
  geom_point(alpha=0.5,size=2,shape=15) + 
  scale_x_log10()+ 
  geom_smooth(method="lm",size=1.5)


# save
ggsave(filename="test.png", plot = test_plot_2, width = 12, height = 10, dpi = 1200, units = "cm")






















