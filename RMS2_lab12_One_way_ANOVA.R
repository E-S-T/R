# RMS2 lab 12 - One-way ANOVA
data()
growth <- PlantGrowth
summary(growth)

#weight as dv (y), group as iv (x)

#boxplot
with(data = growth, boxplot(weight ~ growth))

#Levene test (to test homogeneity of variance)
install.packages("car")
library(car)
with(data = growth, leveneTest(y = weight, group = group, center = median))

#fit model
growth_anova <- aov(formula = weight ~ group, data = growth)
summary.aov(growth_anova)
#results show that there are significant differences between the groups
#need summary.lm to say where the differences are
summary.lm(growth_anova)
#no sig diff between control and trt1 or control and trt2


#EXAMPLE 2
Drug <- c('drug1', 'drug1', 'drug1', 'drug1', 'drug1', 'drug2','drug2',
          'drug2', 'drug2', 'drug2', 'control', 'control', 'control', 'control',
          'control')
score <- c(16,18,10,12,19,4,7,8,10,1,2,10,9,13,11)
mydata <- data.frame(Drug, score)

#build anove model
myanova <- aov(score ~ Drug, data = mydata)
myanova
summary.aov(myanova)

#anova assumptions
#1) independance of errors:durbin watson test
install.packages("car")
library(car)
durbinWatsonTest(myanova)
#2) homogeneity of variance: levene test
leveneTest(myanova)
#3)normality of residuals: qqplot or shapiro wilk test
qqplot(myanova)
shapiro.test(myanova)
#4)outliers: 
plot(mydata$Drug, mydata$score)
#theres an outlier


#EXAMPLE 2
animals= read.csv("C:/Users/Esther/Downloads/animals.csv")
describeBy(animals$score, animals$animal, mat=T)
animal_aov <- aov(score ~ animal, data = animals)
summary(animal_aov)
#look at levels of factor
levels(animals$animal)
#tell R which groups to compare
c1 <-c(.5, -.5, .5, -.5) #canines vs felines
c2 <-c(1, 0 , -1, 0) #cougars vs housecats
c3 <-c(0, 1, 0, -1) #dogs vs wolves
#combine above 3 lines into matrix
matrix <- cbind(c1,c2,c3)
#tell R that the matrix gives the contrasts you want
contrasts(animals$animal) <- matrix
#final result
model2 <- aov(score ~ animal, data = animals)
summary(model2)
#this gives you the contrasts
summary.aov(model2, split = list(animal=list("canines vs felines" = 1,
                                 "cougars vs housecats" = 2,
                                 "dogs vs wolves" = 3)))
#all groups have significantly different scores
