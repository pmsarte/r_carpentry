# learning about the dplyr package 
gapminder <- read.csv("data/gapminder_data.csv") 
#subset in base R 
# get all rows where the continent is Africa 
gapminder[gapminder$continent=="Africa",]
# for these rows, just select the gbp per capita
gapminder[gapminder$continent=="Africa","gdpPercap"]
mean(gapminder[gapminder$continent=="Africa","gdpPercap"])

# load our package
install.packages("dplyr")
library(dplyr)

# select columns, note that %>% is a pipe, select is a new function from dplyr and doesn't need quotes   
year_country_gdp <- gapminder %>% select(year,country,gdpPercap) 

year_country_gdp_africa <- gapminder %>% filter(continent =="Africa") %>% select(year,country,gdpPercap)

# summarise by groups 
#load data
gdp_by_continent <- gapminder %>% 
# group by continent 
group_by(continent) %>% 
  #summarise
  summarize(mean_gdp = mean(gdpPercap)) 

# find average life expecancy per country 

#load data 
life_exp_country <- gapminder %>% 
  #group by country 
  group_by(country) %>%
#summarise
summarize(mean_life_exp = mean(lifeExp))
  
life_exp_country %>% filter(mean_life_exp==min(mean_life_exp))
life_exp_country %>% filter(mean_life_exp==max(mean_life_exp))

life_exp_country %>% arrange(mean_life_exp) # lowest to highest
life_exp_country %>% arrange(desc(mean_life_exp)) #highest to lowest 
# or you can use 
life_exp_country[life_exp_country$mean_life_exp==max(lifeexp_by_country$mean_life_exp),]

# use count to find the number of rows
# in 2002, different continents have different number of countries 
gapminder %>% filter(year == 2002) %>% count(continent)
gapminder %>% filter(year == 1997) %>% count(continent)

#tell me how many different years are there 
unique(gapminder$year)

# can perform more than one function inside summarise 

gapminder %>% group_by(continent) %>% summarise(mean_life=mean(lifeExp),se_life=sd(lifeExp)/sqrt(n())) 

# using mutate (adds new columns)

gdp_pop_summary <- gapminder %>% mutate(gdp_billions = gdpPercap*pop/10^9) %>% group_by(continent,year) %>% summarize(mean_gdp_bill = mean(gdp_billions)) 

