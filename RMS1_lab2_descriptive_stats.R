#RMS1 lab 2 - descriptive stats (mean, standard deviation)

mile <- c(3748, 8704, 1873, 2747, 19873, 92837, 1728)

#mean
mean(mile)

#variance
var_mile<- sum((mile-mean(mile))^2)/10
var_mile

#standard deviation
sd_mile<- sqrt(sum((mile-mean(mile))^2)/10)
sd_mile
