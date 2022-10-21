#Clear the environment
rm(list = ls())
#load the data
climateData = read.csv("climate_change.csv")

#Create subsets for training & testing the model
climateTrain = subset(climateData,Year <=2006)
climateTrain = subset(climateData,climateData$Year <=2006)
#climateTrain = filter(climateData,"Year" <2006)
#all are the same commands
#testing a smaller subset
climateTest = subset(climateData,Year >2006)

#create a linear model - first model in R
#we want to predict variable temp in dataset
# all are x variables while temp is y variable
climatelm = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.12 + TSI + Aerosols, data=climateTrain)

