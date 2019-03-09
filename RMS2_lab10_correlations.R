#RMS1 lab 10 - correlations

exam_anx = read.csv("C:/Users/Esther/Downloads/exam_anxiety.csv")

#assumptions: 
#1) contiuous data: can only know from design
#2) normal distribution: qqplot, shapiro test
shapiro.test(exam_anx$Exam)
shapiro.test(exam_anx$Anxiety)
shapiro.test(exam_anx$Revised)
#all have normal distribution

#3)linear relationship and 4)homogeneity of variance: visualise using scatterplot
plot(exam_anx$Exam, exam_anx$Anxiety)
#appears to be linear relationship and good variance

#correlation between exam results and anxiety?
cor.test(exam_anx$Exam, exam_anx$Anxiety)
#yes

#correlation between exam results and amount of studying?
cor.test(exam_anx$Exam, exam_anx$Revised)
#yes