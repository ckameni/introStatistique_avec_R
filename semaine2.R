
search()
detach(smp)
describe(smp.c,num.desc=c("mean","median","min","max"))

require(prettyR)
summary(smp.c$age)
describe(smp.c$age)

str(smp.c)
summary(smp.c$age)

38.9+1.96*13.28/sqrt(797) 
38.9-1.96*13.28/sqrt(797)

pnorm(39.82,)

install.packages("binom")
require(binom)
binom.confint(3,10,method="all")

binom.confint(300,1000,method="all")


# coefficient de correlation de pearson
 plot(jitter(smp.c$age),jitter(smp.c$n.enfant))

cor(smp.c$age,smp.c$n.enfant,use="complete.obs")
smp.c$ed.b<-ifelse(smp.c$ed>2,1,0)
str(smp.c)

table(smp.c$ed.b,smp.c$ed,deparse.level=2,useNA="always")


#calcul du risque relatif et de l'odds ratio
install.packages("Epi")
library(Epi)


twoby2(1-smp.c$ed.b,1-smp.c$dep.cons)#1-evitement du danger et 1-depression consensuelle
# 0= avoir le facteur de risque, 1= ne pasl'avoir
# c'est pourquoi on fait 1- pour changer le 1 en 0 et vice versa, pour
#pouvoir utiliser la fonction twoby2