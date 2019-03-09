#RMS1 lab 9 - t-tests

mysample <- c(10,15,26,24,27,41,23,19,27)
t.test(mysample, mu = 21)

v1 <- c(1,2,3,NA)
v2 <- c(1,2,"3", NA)
is.numeric(v1)
is.numeric(v2)
sum(is.na(v2))
which(is.na(v2))
#need all numeric data for t-test
v2n <- as.numeric(v2)
is.numeric(v2n)

#new example
control <- c(36.4, 49.2, 26.8, 32.2, 41.9, 29.8, 36.7, 39.2, 42.3, 41.9)
treated <- c(32.2, 45.2, 31.3, 27.1, 33.4, 29.0, 24.1, 38.2, 38.0, 37.2)

#test for independance
summary(control)
summary(treated)
sd(control)
sd(treated)

#test for homogeniety of variance
var.test(control, treated, ratio = 1, conf.level = 0.95)
#so the two sample have equal variance

#check for normal distribution
shapiro.test(control)
shapiro.test(treated)
#or
qqnorm(control)
qqline(control)
#lies approximately on straight line so has normality

t.test(x = control, y = treated, paired = F, var.equal = T, conf.level = 0.95)
#p-value is larger than 0.05 so can't reject null. non-significant results