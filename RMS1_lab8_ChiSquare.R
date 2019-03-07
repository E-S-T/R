#RMS1 lab 8 - Chi-Square

#p=.99 means that alpha = 0.01
#df=1 means there are two groups (e.g. men and women)
#this code calculates the critcal value which the chi-sq
#value must be larger than to achieve significance
qchisq(p = .99, df = 1)


count1 <- matrix(c(38,14,11,51,80,76), nrow = 3)
count1
result <-chisq.test(count1)
result
#27.95>6.63 so count2 results are significant

count2 <- matrix(c(38,14,11,39, 15,10), nrow = 3)
count2
result2 <-chisq.test(count2)
result2
#0.09<6.63 so count2 results are not significant