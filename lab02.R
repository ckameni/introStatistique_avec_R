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
hist(smp$age,nclass=8)# ajuster la frequence(intervalles de classes)
lines(density(smp$age, na.rm=TRUE)) #representer la densité
hist(smp$age, nclass=8, prob=TRUE) # convertir l'histogramme en histogramme de densite
hist(smp$age, nclass=8, prob=TRUE,las=1) # ajuster leslabelles( ordonées)
lines(density(smp$age, na.rm=TRUE)) #representer la densité cette fois


 #version finale embellie
hist(smp$age, nclass=8, prob=TRUE, col="cornflowerblue", border="white",
     xlim=c(0,100), main="", xlab="Âge (années)", ylab="Densité")
lines(density(smp$age, na.rm=TRUE), lwd=2, col="orange")
text(65, 0.025, paste("N =", sum(complete.cases(smp$age))), cex=1.2)
