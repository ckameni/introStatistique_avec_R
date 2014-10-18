##
## Lab 2
##

## ------------------------------------------------------------------------
library(MASS)


## ------------------------------------------------------------------------
head(smp$age)


## ------------------------------------------------------------------------
smp[,1]
smp[,"age"]  


## ------------------------------------------------------------------------
head(smp$prof == "agriculteur")
table(smp$prof == "agriculteur")


##  indexation--------------------------------------------------------------
which(smp$prof == "agriculteur")


## age des individus dont la profession est "agriculteur"-------------------
smp$age[which(smp$prof == "agriculteur")]


## alternatif------------------------------------------------------------
subset(smp, prof == "agriculteur", age)


##------------------------------------------------------------
subset(smp, prof == "agriculteur", 1:5)  
names(smp)[1:5]
subset(smp, prof == "agriculteur", c(age, prof, duree, discip, n.enfant))


## double filtre --------------------------------------------------------
subset(smp, prof == "agriculteur" & n.enfant > 2, 
       c(age, prof, duree, discip, n.enfant)) 


## ------------------------------------------------------------------------
subset(smp, prof == "agriculteur" & n.enfant > 2 & complete.cases(duree), 
       c(age, prof, duree, discip, n.enfant))


## ------------------------------------------------------------------------

tab <- table(smp$n.enfant.cat)
tab

## ------------------------------------------------------------------------
sum(tab)
tab / sum(tab)


## frequence des effectifs d'un tableau-------------------------------------
prop.table(tab)


## ------------------------------------------------------------------------
round(prop.table(tab), 3)


## ------------------------------------------------------------------------
round(prop.table(tab)*100, 1)


## representations d'une variable categorielle------------------------------
barplot(prop.table(tab) * 100)
barplot(prop.table(tab) * 100, ylim=c(0, 30)) # definir l'axe des ordonnées
barplot(prop.table(tab) * 100, ylim=c(0, 30), las=1)# ajuster les ordonées

#version embellie
barplot(prop.table(tab) * 100, ylab="Proportion", col="cornflowerblue",
        border=NA, ylim=c(0, 30), las=1)

#---------------------------------------------------------------------------
## representation d'une variable numerique----------------------------------
hist(smp$age)
hist(smp$age,breaks=6)
hist(smp$age,nclass=10)# ajuster la frequence(intervalles de classes)
lines(density(smp$age, na.rm=TRUE)) #representer la densité
hist(smp$age, nclass=6, prob=TRUE) # convertir l'histogramme en histogramme de densite
hist(smp$age, nclass=8, prob=TRUE,las=1) # ajuster leslabelles( ordonées)
lines(density(smp$age, na.rm=TRUE)) #representer la densité cette fois


 #version finale embellie
hist(smp$age, nclass=8, prob=TRUE, col="cornflowerblue", border="white",
     xlim=c(0,100), main="", xlab="Âge (années)", ylab="Densité")
lines(density(smp$age, na.rm=TRUE), lwd=2, col="orange")
text(65, 0.025, paste("N =", sum(complete.cases(smp$age))), cex=1.2)




########Quiz
table(smp$n.enfant.cat)
smp <- read.csv2("smp2.csv")


#
dim(smp[c(20,221,342,446,531),])


complete.cases(smp[c(20,221,342,446,531),])
sa<-smp[c(20,221,342,446,531),]
dim(sa)
complete.cases(sa<-smp[c(20,221,342,446,531),])

sa[is.na(sa),]
str(smp)

str(n.enfant)

names(smp)
attach(smp)
detach(smp)
table(dep.cons)
str(dep.cons)

#7    
enfant<-smp$n.enfant[which(dep.cons==1)]
mean(enfant,na.rm=T)

#8
tab <- table(smp$prof,useNA="ifany")
round((tab / sum(tab)*100),2)

# alternative
prop.table(tab)
round(prop.table(tab), 3)
round(prop.table(tab)*100, 2)

#9
table(duree)
Duree<-summary(smp$duree[which(age>35)])
Duree

#10
mean(smp$dur.interv[suicide.past == 1])
mean(smp$dur.interv[smp$suicide.past == 1])
mean(smp[smp$suicide.past == 1,"dur.interv"],na.rm=T)

b<-smp$dur.interv[which(smp$suicide.past == 1)]
round(mean(b,na.rm=T),2)
length(a);length(b)

