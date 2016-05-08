plot2 <- function()
{
        #Have total emissions from PM2.5 decreased in the Baltimore City, 
        #Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base
        #plotting system to make a plot answering this question.
        
        #Loading data
        setwd("/Users/luisfer/Documents/Coursera/DataScience/Exploratory Data Analysis/exdata-data-NEI_data")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        #Subsetting and Aggregating
        NEI_SUB <- subset(NEI,fips=="24510")
        Emissions <- aggregate(NEI_SUB[,'Emissions'],by=list(NEI_SUB[,'year']),FUN=sum)
        
        #Generating png file and graph
        png(filename='plot2.png')
        barplot(Emissions$x,names.arg=Emissions$Group.1,col="blue",main=expression('Total Emission of PM2.5 in Baltimore'),xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
        dev.off()
}