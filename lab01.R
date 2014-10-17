##
## Lab 1
##

## ------------------------------------------------------------------------
smp <- read.csv2("smp2.csv")


## ------------------------------------------------------------------------
ls()
dim(smp)
names(smp)
str(smp)
summary(smp)
describe(smp)

## ------------------------------------------------------------------------
help(dim)


## ------------------------------------------------------------------------
str(smp)


## ------------------------------------------------------------------------
summary(smp)
summary(smp$age)

## ------------------------------------------------------------------------
smp$age[1]
smp$age[c(1,2)]
smp$age[c(1,3)]


## ------------------------------------------------------------------------
smp$age[1:10]


## ------------------------------------------------------------------------
head(smp$age)
head(smp$age, n=10)


## ------------------------------------------------------------------------
head(smp$age, 10)


## ------------------------------------------------------------------------
summary(smp$age)


## ------------------------------------------------------------------------
min(smp$age)


## ------------------------------------------------------------------------
min(smp$age, na.rm=TRUE)
max(smp$age, na.rm=TRUE)


## ------------------------------------------------------------------------
range(smp$age, na.rm=TRUE)


## ------------------------------------------------------------------------
head(smp$abus)
unique(smp$abus)


## ------------------------------------------------------------------------
length(smp$abus)
nrow(smp)
table(smp$abus)

sum(table(smp$abus))



## ------------------------------------------------------------------------
table(smp$abus, useNA="always")

## ------------------------------------------------------------------------
sum(is.na(smp$abus))
sum(!is.na(smp$abus))
sum(complete.cases(smp$abus))


## ------------------------------------------------------------------------
head(factor(smp$abus))
head(factor(smp$abus, labels=c("Non", "Oui")))




## ------------------------------------------------------------------------
abus <- factor(smp$abus, labels=c("Non", "Oui"))
table(abus)
head(relevel(abus, ref="Oui"))


## ------------------------------------------------------------------------
head(smp$n.enfant)
summary(head(smp$n.enfant))
table(smp$n.enfant, useNA="always")

head(smp$n.enfant > 4)
table(smp$n.enfant > 4)



## ------------------------------------------------------------------------
smp$n.enfant.cat <- factor(smp$n.enfant)
head(smp$n.enfant.cat)
levels(smp$n.enfant.cat)
nlevels(smp$n.enfant.cat)
levels(smp$n.enfant.cat)[6:13] <- "5+"
nlevels(smp$n.enfant.cat)
table(smp$n.enfant.cat)


## ------------------------------------------------------------------------
# decouper la variable age en tranches.
smp$age.cat <- cut(smp$age, breaks=c(19, 25, 35, 45, 83,include.lowest=T))
table(smp$age.cat)


## ------------------------------------------------------------------------
save(smp, file="smp_v1.rda")
dir(pattern="csv")



################################################################################
##################################     Quiz 1   ################################
################################################################################

smp <- read.csv2("smp2.csv")

#4
z<-sample(0:1,10,1)
z

da1<-factor(z, labels=c("Non", "Oui"));da1

das<-factor(z, levels=c(1,0),labels=c("Non", "Oui"),na.rm=T),das
#8


yy<-sample(1:9,10,1);yy
yy<-factor(yy>=5,labels=c("<5", "5+"));yy;class(yy)

   sa<-factor(n.fratrie>=5,labels=c("<5", "5+")) 
 t
       factor(table(n.fratrie>=5),labels=c("<5", "5+"))
      names(smp)

class(age)
x<-head(age);x
class(y)

#9


length(subset(smp,(age>=20 & cage<=30))$age)

#10

mean(dur.interv[1:300],na.rm=T)
median(dur.interv[1:300],na.rm=T)


#6e


attach(smp)
min(smp$age,na.rm=T)
summary(age)

table(cut(age,breaks=quantile(age,na.rm=T)  ) )

#7
IQR(dur.interv,na.rm=T)

summary(dur.interv)

table(cut(dur.interv,breaks=quantile( dur.interv,na.rm=T),right=T,include.lowest=T  ) )
