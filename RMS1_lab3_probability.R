#RMS1 lab 3 - probability

#100 random tosses of a coin
coin <- sample(x=c("h", "t"), size=100, replace=TRUE)
coin


#coin toss
tosscoin(times = 1, makespace = TRUE)



#dice
install.packages("prob")
library(prob)

#rolling one dice
one_dice <- rolldie(times=1, nsides=6, makespace=TRUE)
dice_sim <-sim(x=one_dice, ntrials = 4, )
dice_sim

#rolling three dice
two_dice <- rolldie(times = 3, nsides = 6, makespace = TRUE)
dice_sim2 <-sim(x=two_dice, ntrials = 4)
dice_sim2
