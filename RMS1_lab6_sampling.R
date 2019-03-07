#RMS1 lab 6 - sampling

#population of 1000 normally distributed people
pop <- rnorm(n = 1000)
hist(pop)

sampleMean <- function(n, population){
  aSample <- sample(population, size = n, replace = TRUE)
  return(mean(aSample))
  }

aMean <-sampleMean(n=10, population=pop)
print(aMean)

n <-1000
variousMeans <-replicate(n=n, sampleMean(n=10, population=pop))
hist(variousMeans, main = paste("histogram of", n, "means"))
