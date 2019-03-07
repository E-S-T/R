#RMS1 lab 1 - basic maths

#rounding
round(1.45732, 2)

#test results
#Simon
exam_s <- 45
hw_s <- 68
cw_s <- 56
grade_s <- (exam_s*.5)+(hw_s*.25)+(cw_s*.25)
grade_s
#53.5%

#Kirsty
exam_k <- 80
hw_k<- 10
cw_k <- 41
grade_k <- (exam_k*.5)+(hw_k*.25)+(cw_k*.25)
grade_k
#52.75%
#so Simon has the higher grade

#combine both
exam<-c(45, 80)
hw<-c(68, 10)
cw<-c(56,41)
grades <- (exam*.5)+(hw*.25)+(cw*.25)
round(grades, 0)
