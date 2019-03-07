#RMS1 lab 7 - hypothesis testing

#alpha = 5% (5/2 = 2.5)
qnorm(c(0.025, 0.975))
#alpha = 8% (8/2 = 4)
qnorm(c(0.04, 0.96))

#example: IQ of 80, mean is 100, sd is 15
#calc z score
IQ_z<- (80-100)/15

IQ_prob<- pnorm(IQ_z, lower.tail = T)
IQ_prob
#So only 9% of people would be expected to have an IQ of 80 or lower