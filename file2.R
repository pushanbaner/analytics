#Data structures in R

#vectors----
v1=10
v1
print(v1)
v2=1:100
v2
(v3=c(1,6,4,10))   #create and print
v4
v4=seq(1,100,5)
v4
v5=c('A', 'Dhiraj', 'IIFT')
v5
class(v5)
(v6=1:100000)
(v7=rnorm(100, mean=60, sd=10))
mean(v7)
sd(v7)
v7
v7[1:10]
v7[seq(1,100,2)]
v7[v7>50]
v7[v7>70 | v7<60]
plot(v7)
hist(v7)
plot(density(v7))
hist(v7, breaks=10)
quantile(v7)
summary(v7)
quantile(v7, seq(0.1, .1))
quantile(v7, seq(0.1, .01))
sort(v7)
sort(v7, decreasing = TRUE)

#matrix----
(data=24:1)
(m2=matrix(data, nrow=4, byrow=T))
m2[,1]
m2[2,]
m2[, c(1,3)]
m2[c(2,4), c(2,4,5)]
m2
rowSums(m2)
colSums(m2)
rowMeans(m2)
colMeans(m2)
m2
table(mtcars$cyl)
t1=table(mtcars$cyl, mtcars$gear, dnn = c('cyl', 'gear'))
t1
margin.table(t1)
margin.table(t1, margin = 1)
margin.table(t1, margin = 2)
addmargins(t1)
?addmargins
addmargins(t1, FUN = mean)
addmargins(t1, FUN = list(list(mean, sum, sd, var), list(mean, sum, sd, var)))
m2
sweep(m2, MARGIN = 1, STATS = 4, FUN='*')
sweep(m2, MARGIN = 1, STATS = c(1,2,3,4), FUN='*')
sweep(m2, MARGIN = 2, STATS = c(1,2,3,4,5,6), FUN='*')
?sweep



#dataframe----
data()
AirPassengers
class(mtcars)
head(mtcars,n=3)
tail(mtcars)
dim(mtcars)
nrow(mtcars)
names(mtcars)
rownames(mtcars)
summary(mtcars)


#summarizing / filtering data
mtcars[mtcars$gear==4, ]
mtcars[mtcars$gear==4 & mtcars$mpg<25, c('mpg','gear','cyl')]
mtcars[order(mtcars$mpg), ]
mtcars[c(1,3,4), c(1,5)]


#export to csv
mtcars
write.csv(mtcars, 'keyur.csv')
df1=read.csv('keyur.csv')
head(df1)
write.csv(mtcars, 'keyur1.csv', row.names = F)
df2=read.csv('keyur1.csv')
head(df2)
(carnames=paste('car', 1:32, sep = ':'))
df2$carb=carnames
head(df2)


#create DF
#rollno, name, gender, marks, grade
(rollno=1:30)
(name=paste('student', 1:30))
rep('M',3)
rep(c('M','F'), c(12,18))
set.seed(123)
(gender=sample(c('M','F'), size = 30, replace=T, prob = c(.6,.4)))
table(gender)
prop.table(table(gender))

(marks=runif(30, min=50, max = 100))
x=c(-14.45, -14.67, 14.45, 14.67)
x
trunc(x)
round(x,1)
floor(x)
ceiling(x)
(grades = sample(c('A','B','C'), size=30, replace = T, prob = c(.3, .4, .2)))
table(grades)
prop.table(table(grades))
rollno:name:gender:marks:grades
students=data.frame(rollno,name, gender,marks,grades)
head(students)
str(students)
summary(students)
students$name=as.character(students$name)
str(students)
summary(students)
students$grades=factor(students$grades, ordered=T)
students$grades
students$grades=factor(students$grades, ordered=T, levels = c('C','B','A'))
students$grades
?factor
barplot(table(students$grades),col=1:3)
hist((students$marks))
range(students$marks)
hist(students$marks, breaks=c(0,50,70,90,100))
students[students$gender=='M' & students$marks>70, ]


#
install.packages(dplyr)
students %>% filter(gender=='M' & marks>70) %>% arrange(marks) %>% head(n=3) %>% select(rollno, name)
