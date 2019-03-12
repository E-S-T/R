#RMS3 lab 15: More Multiple Regression and assumptions

install.packages("car")
library(car)

assump_data <- read.csv("C:/Users/Esther/Downloads/assump_testing.csv")
MMR <- lm(y~x1+x2+x3, data = assump_data)
summary(MMR)

#assumptions
#1) are errors normally distributed?
plot(MMR, which = 2) #QQplot is a little skewed
hist(residuals(MMR)) #there is an error there
shapiro.test(MMR) #looks okay but there is some skew in the data

#2)homogeneity of variances?
plot(MMR, which = 3) #the red line is not straight across so a non constant variance test is needed
ncvTest(MMR)

#3) multicollinearity?
cor(assump_data) #none of the cors are too high
vif(MMR)
#assumption of linearity
plot(assump_data$x1, assump_data$y)
abline(lm(y~x1, data=assump_data))
plot(assump_data$x2, assump_data$y)
abline(lm(y~x2, data=assump_data))
plot(assump_data$x3, assump_data$y)
abline(lm(y~x3, data=assump_data))
#shows that x3 isnt related to y

plot(MMR, which=1) #fitted vs residuals
residualPlots(MMR) # some curvature but no significant violations of normality

#4) outliers?
plot(MMR, which = 4) #first value has a high cooks distance
MMR2 <- lm(y~x1+x2+x3, data = assump_data, subset = -1)
plot(MMR2, which = 4)
summary(MMR2) # the model looks better now. if you were to rerun the assumption tests then they would all look better

par(mfrow=c(2,2))
plot(MMR2)
