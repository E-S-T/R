#RMS3 lab 14 - Multiple Regression

MRdata <-mtcars
#want to predict mpg from the other factors
fit <- lm(formula = mpg ~ cyl + disp + hp + drat + wt + qsec, data = MRdata)
summary(fit)
#the f stat is significant
#can standardise betas 
install.packages("QuantPysc")
library(QuantPysc)
lm.beta(fit)
#from this we can see that disp has the highest standardised beta

#we can run as eries of simple regressions to look further
fit1 <- lm(formula = mpg ~cyl, data = MRdata)
summary(fit1)
fit2 <- lm(formula = mpg ~disp, data = MRdata)
summary(fit2)
fit3 <- lm(formula = mpg ~hp, data = MRdata)
summary(fit3)
fit4 <- lm(formula = mpg ~drat, data = MRdata)
summary(fit4)
fit5 <- lm(formula = mpg ~wt, data = MRdata)
summary(fit5)
#we can see that all IVs have sig relationships with the DV when run in isolation
#wt has the highest variance accounted for

#compare a model with 3 factors that accounts for the most variance
mostvar <- lm(formula = mpg ~ cyl + disp + wt, data = MRdata)
summary(mostvar)
#and one that accounts for the least variance
leastvar <- lm(formula = mpg ~wt + hp + disp, data = MRdata)
summary(leastvar)
#and you can make one with the best two
best_two <- lm(formula = mpg ~ cyl + wt, data = MRdata)
summary(best_two)


#EXAMPLE 2
fire <- data.frame(fires=c(44, 94, 38, 65, 95, 57, 20, 52, 64), 
                   age=c(23, 35, 4, 49, 48, 12, 14, 33, 25))
fire_model1 <- lm(fire$fires ~ fire$age)
summary(fire_model1)
#this model predicts a 1.12 increase in fires for each 1 year increase of property age
#and this is significant
#however this model only accounts for 43% of the variance and has a standard error of 18.4 
#so this model is not the whole story

#perhaps house ownership is important
fire$owned <- c(70, 3, 10, 96, 40, 4, 80, 78, 15)
fire_model2 <- lm(fire$fires ~ fire$age + fire$owned)
summary(fire_model2)
#this model has higher variance accounted for (97%) and lower standard error (3.6)
#and all factors have a signicant effect, so this is a good model
#the  model indicates a decrease in 0.49 fires for each unit of increase
#so occupation of the house decreases fire rate


#EXAMPLE 3
OZ = read.csv("C:/Users/Esther/Downloads/ozone_data_noq.csv") 
summary(OZ)
pairs(OZ, panel = panel.smooth)
#bottom 3 plots show relationship between OZ and other factors
attach(OZ)
OZ_model1 <- lm(ozone ~ temp + wind + rad)
summary(OZ_model1)
#rad is not significant so should be removed
OZ_model2 <- lm(ozone ~ temp + wind)
summary(OZ_model2)
#removing rad was good so rad as this made no change to the model
#still something missing though. this model still doesn't account for all the variance
#and still has high error
#but theres no more data so more research would be needed to see what is missing
