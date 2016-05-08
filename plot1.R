plot1 <- function()
{
        # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
        # Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
        # for each of the years 1999, 2002, 2005, and 2008.
        
        setwd("/Users/luisfer/Documents/Coursera/DataScience/Exploratory Data Analysis/exdata-data-NEI_data")
        #Loading data
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        #Aggregating data by year
        Emissions <- aggregate(NEI[,'Emissions'],by=list(NEI$year),FUN=sum)
        
        #Generating png file and graph
        png(filename='plot1.png')
        barplot(Emissions$x,names.arg=Emissions$Group.1,col="blue",main=expression('Total Emission of PM'[2.5]),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
        dev.off()
}