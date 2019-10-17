#reshape

#missing values

v1 = c(1,2,3,5)
is.na(v1)

v2 = c(1, NA,3,NA)
sum(is.na(v2))

library (VIM)

data(sleep)
?sleep
sleep
dim(sleep)

str(sleep)
summarise(sleep)

library(reshape2)
(rollno = 1:30)
(sub1 = rnorm(30, mean=50, sd=10))
(sub2 = rnorm(30,65,12))
(sub3 = runif(30, min=50, max=90))

exam =data.frame(rollno, sub1, sub2,sub3)
head(exam)
colMeans(exam[,-1])
rowMeans(exam[,-1])
rowSums(exam[,-1])
exam %>% mutate(totalMarks = sub1+sub2+sub3) %>% head()

melt(exam,id.vars='rollno')
longdata = melt(exam,id.vars='rollno', variable.name='subject', value.name='marks')
dim(longdata)
head(longdata)

longdata %>% group_by(subject) %>% summarise(mean(marks), max(marks), min(marks), sd(marks))
widedata = dcast(longdata,rollno~subject)
head(widedata)
head(exam)

(gender = sample(c('M','F'),size=30, replace=T))
exam =data.frame(rollno, sub1, sub2,sub3,gender)
colMeans(exam[,-c(1,5)])
rowMeans(exam[,-c(1,5)])
rowSums(exam[,-c(1,5)])
longdata %>% group_by(subject) %>% summarise(mean(marks), max(marks), min(marks), sd(marks))
widedata = dcast(longdata, rollno + gender ~ subject)
head(widedata)
head(exam)
widedata =data.frame(rollno, sub1, sub2,sub3,gender)
dim(sleep)
is.na(sleep)
sum(is.na(sleep))
rowSums(is.na(sleep))
#df=sleep
#df$missing = rowSums(is.na(df))
#head(df)
colSums(is.na(sleep))


v4 = c(1.5,NA,6,NA)
is.na(v4)
v4[is.na(v4)]
mean(v4, na.rm=T)
v4
v4[is.na(v4)]=min(v4, na.rm=T)
v4

?sleep
complete.cases(sleep)
sleep[complete.cases(sleep),]
sum(complete.cases(sleep))
dim(sleep[complete.cases(sleep),])
sleep[c(rep(T,22), rep(F,30)),]

sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
