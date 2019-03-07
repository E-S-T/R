#RMS1 lab 5 - continuous probability distributions

#How many people have top 5% IQ?
qnorm(p = 0.95, mean = 100, sd = 15, lower.tail = TRUE)
#or this does the same thing
qnorm(p = 0.05, mean = 100, sd = 15, lower.tail = FALSE)

#with an IQ of 125, how many people are below me?
pnorm(q = 125, mean = 100, sd = 15)
#using lower.tail=FALSE gives those above 125 IQ

#Z-score = -2.43
prob_more <- pnorm(q = 50, mean = 67, sd = 7, lower.tail = FALSE)
prob_more
prob_less <- pnorm(q = 50, mean = 67, sd = 7, lower.tail = TRUE)
prob_less

#salery example
#Z-score = (24832-25301)986 = -0.48
salery_more <-pnorm(-0.48, lower.tail = FALSE)
salery_more
salery_less<- pnorm(-0.48, lower.tail = TRUE)
salery_less
