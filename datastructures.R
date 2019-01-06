# title : data structures un R

# vectors ----
cv = c('a','b','c')
nv = c(12,45,27)
lv = c(TRUE,FALSE,T,F,F)
cv
nv
lv
(x = 1:100000)
?set.seed
set.seed(100)
(x=rnorm(100000,mean=60,sd=10))
(x=trunc(rnorm(100000,mean=60,sd=10)))
x1=sort(x)

#values between 60 and 70
x[x>=60 & x <=70]
length(x)
mean(x)
xt=table(x)
xt
sort(xt,decreasing = T)
sort(xt,decreasing = T)[1:2]
summary(x)
quantile(x)
quantile(x,c(.1,.5,.9))
quantile(x,seq(0,1,0.1))
boxplot(x)

x3=rnorm(50,mean=20,sd=3)
stem(x3)
hist(x3)
hist(x3,breaks=12,col=1:3)
hist(x3,freq=F)
lines(density(x3))

#how many values bet 60 and 70

length(x[x>=60&x<=70])

x2=rnorm(1000)
plot(density(x2))
abline(v=0,h=.2)

x3=seq(1,100,2)
mean(x3)


#matrix ----
(m1=matrix(c(1:24),nrow=6,byrow=T))
m1[1]
m1[10:14]
(m2=matrix(c(1:24),nrow=6,byrow=F))
(m3=cbind(m1,m2))
(m4=rbind(m1,m2))
colSums(m1)
# subset from a main matrix
m1
m1[1,] # row only
m1[1,2] # row and column 
m1[1:2,3:4] # rows and columns
m1[c(1,4),c(2,3)]

m1>10
m1[m1>10&m1<15]
m1 > 10 & m1 < 15
m1+m2
t(m1)
m1
sweep(m1,MARGIN=1,STATS=c(2,3,4,5,6,7), FUN="+") #row wise
sweep(m1,MARGIN=2,STATS=c(-1,-1,-1,-1,-1,-1), FUN="*") #column wise
sweep(m1,MARGIN=2,STATS=c(5), FUN="*") #column wise

#dataframe ----
n=30
(rollno = paste('A',1:n,sep=''))
(names=paste('student',1:n,sep=''))
class(names)
set.seed(100)
(gender=sample(c('M','F'),size=n,replace=T,prob=c(.5,.5)))
table(gender)
set.seed(101)
(marks1 = round(rnorm(n=n,mean=70,sd=7),2))
set.seed(102)
(marks2 = round(rnorm(n=n,mean=80,sd=10),2))
set.seed(103)
(marks3= sample(c('A','B','C','D'),size=n,replace=T,prob=c(.3,.2,.3,.2)))
#lets make C as highest rank
table(marks3)
# creating data frame
df=data.frame(rollno,names,gender,marks1,marks2,marks3,stringsAsFactors=F)
df
summary(df)
str(df)
df$rollno
df$gender=factor(df$gender)
df$marks3=factor(df$marks3)
df$gender
df$rollno
summary(df)
str(df)
df
#queries
#filter
df[1:5,1:2] # print 5 rows and 2 columns
df[1:5,c('rollno','names','marks1')] # show specific rows and column names
df[df$marks1>70,c('rollno','names','marks1')]
df[df$marks1>70 & gender=='M',c('rollno','names','marks1')]
#add one more column
set.seed(103)
df$course=sample(c('MBA','BBA'),size=n,replace=T,prob=c(.6,.4))
df
head(df) # first 6 rows
tail(df) # last 6 rows
str(df)
df$marks3=factor(df$marks3,ordered=T) # convert to category for marks3 & ordered
# change order of ranks in above order
df$marks3=factor(df$marks3,ordered=T,levels=c('B','D','C','A'))
df$course=factor(df$course) # convert to category for course
str(df)
# this box plot is good as it shows for each grade in marks3, how much did marks2 
boxplot(marks2~marks3,data=df)
boxplot(marks2~(course+gender),data=df)
aggregate(marks2~course,data=df, FUN=mean) #mean for course
aggregate(marks2~course+gender,data=df, FUN=mean)
aggregate(marks2~course+gender+marks3,data=df, FUN=mean)
library(dplyr)
x %>% f(y)
f(x,y)

df %>% count()
count(df)

#grouping by course, mean of marks2
aggregate(marks2~course,data=df, FUN=mean) #mean for course
df %>% group_by(course) %>% summarise(mean(marks2))
df %>% group_by(course) %>% summarise(mean(marks2),mean(marks1))
df %>% group_by(course) %>% select(marks1) %>% top_n(1)
df %>% filter(gender == 'F' & marks3 =='A') %>% tally()
df %>% filter(gender == 'F' & marks3 =='A') %>% summarise(n())
df %>% sample_frac(.2)
df %>% sample_n(3)

install.packages('wordcloud2')
library(wordcloud2)

# factors----
