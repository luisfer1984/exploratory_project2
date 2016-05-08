plot3  <- function()
{
        # Load ggplot2 library
        require(ggplot2)
        
        #Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpo
        #int, onroad, nonroad) variable, which of these four sources have
        #seen decreases in emissions from 1999–2008 for Baltimore City? 
        #Which have seen increases in emissions from 1999–2008? 
        #Use the ggplot2 plotting system to make a plot answer this question.
        
        #Loading Data
        setwd("/Users/luisfer/Documents/Coursera/DataScience/Exploratory Data Analysis/exdata-data-NEI_data")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        #Subsetting baltimore Data
        NEI_SUB<- subset(NEI, fips == 24510)
        NEI_SUB$year <- factor(NEI_SUB$year, levels=c('1999', '2002', '2005', '2008'))
        
        # Generate the graph
        figure<-ggplot(data=NEI_SUB, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) + geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha=0.10)
        ggsave(figure,file="plot3.png")
}