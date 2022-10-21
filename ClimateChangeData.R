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

summary(climatelm)
#All the starred variable are the important ones
#no of stars indicate "p-value"=significance.Lower is better!
#for e.g. - 0.01 indicates 1% chance that variable does not affect the output variable

#correlation between all variable
CorrelationAUVariables = cor(climateTrain)
View(CorrelationAUVariables)
#which of the following independent variables in N2O highly correlated with absolute correlation


#Can i signify the LM Model
#yes i only use variables that are less correlated with each other
#for example we can use the following
LinReg = lm(Temp ~ MEI + N2O + TSI + Aerosols, data=climateTrain)
summary(LinReg)
#the model says: when N2O goes up by 1, temp goes by 2.532e-0
