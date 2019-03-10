#RMS2 lab 13 - Factorial ANOVA

goggles = read.csv("C:/Users/Esther/Downloads/goggles.csv")
#removings a row from goggles
goggles2 <- goggles[goggles$alcohol=="None"|goggles$alcohol=="4 Pints",]

levels(goggles2$alcohol)
summary(goggles2)
#drop a factor level (drop 2-pints)
goggles2$alcohol <- droplevels(x = goggles2$alcohol)
levels(goggles2$alcohol)
summary(goggles2)

#want male = 0 and female = 1
#check internal numerical representation of the factor levels
levels(goggles2$gender)
labels(levels(goggles2$gender))
levels(goggles2$alcohol)
labels(levels(goggles2$alcohol))

#DUMMY CODING
goggles2$gender == "Female"
as.numeric(goggles2$gender == "Female")
goggles2$dummygender <- as.factor(as.numeric(goggles2$gender == "Female"))
goggles2$dummyalcohol <- as.factor(as.numeric(goggles2$alcohol == "4 Pints"))
summary(goggles2)
head(goggles2)
tail(goggles2)
(goggles2)

#ANOVA
gogglesANOVA <- aov(formula = attractiveness ~ dummyalcohol + dummygender + 
                      dummyalcohol:dummygender, data = goggles2)
summary.aov(gogglesANOVA)
#ANOVA defaults to type 1 Sum of Squares but we want type 3
install.packages("car")
library(car)
Anova(gogglesANOVA, type="III")


#EXAMPLE 2
weights <- read.table(file = "C:/Users/Esther/Downloads/growth.txt", header = T,
                      sep = "\t")
attach(weights)
c(diet, supplement
list(diet, supplement)
length(list(diet, supplement)[[2]])
class(list(diet, supplement)[[2]])
levels(list(diet, supplement)[[2]])       
means <- tapply(X = gain, INDEX = list(diet, supplement), FUN = mean)
barplot(means, beside = T, legend.text = T)

#ANOVA MODEL
growth_ANOVA <- aov(formula = gain ~ diet + supplement + diet:supplement)
summary(growth_ANOVA)
#the interaction between diet and supplement isnt significant. so the effects
#are additive and theres no interaction
#remove the interaction since it isnt significant
growth_ANOVA2 <- aov(formula = gain ~ diet + supplement)
summary(growth_ANOVA2)
#residual variance has increased since theres more accounted for from less factors

#examine lm
summary.lm(growth_ANOVA2)
#baseline for diet is barley. baseline for supplement is agrimore
levels(diet)
levels(supplement)
#so the intercept is the mean gain in weight for animals fed with barley 
#(baseline for factor 1) and fed with agrimore (baseline for factor 2)

#this model can be reduced
new_supp <- weights$supplement
levels(new_supp)[c(1,4)] <- "best"
levels(new_supp)[c(2,3)] <- "worst"
levels(new_supp)
summary(new_supp)
weights$new_supp <- new_supp

#make model
growth_ANOVA3 <- aov(formula = gain ~ diet + new_supp)
summary(growth_ANOVA3)
summary.lm(growth_ANOVA3)
#this model is simpler but explains the same amount of variance