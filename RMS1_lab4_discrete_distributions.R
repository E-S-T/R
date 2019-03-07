#RMS1 lab 4 - discrete distributions

#dbinom give probabilties
#cumulative prob of obtaining 3 or 4 heads in four tosses of a coin
#that is biased (30% heads)
bias_coin<- dbinom(x=3, size = 4, prob = 0.3) + dbinom(x=4, size = 4, prob = 0.3)
bias_coin

#rbinom gives events
rbinom(n=20, size=4, prob = 0.3)
#table gives frquency of rbinom events
prop.table(table(rbinom(n=2000, size=4, prob = 0.3)))
#visualise probability distribution
barplot(prop.table(table(rbinom(n=2000, size=4, prob = 0.3))))

#pbinom is for cumulative probablity
pbinom(q=2, size = 4,  prob = 0.3, lower.tail = FALSE)

#This:
pbinom(q=3, prob = 0.4, size = 12)
#is the same as this:
sum(dbinom(x = c(0,1,2,3), prob = 0.4, size = 12))
