 install.packages("psy")
 library(psy)
 
 head(psy)
 
 
 ##########################################################################
 ###########################chapitre 2 ###################################
 #########################################################################
 if(file.exists("")){
       download.file("https://www.france-universite-numerique-mooc.fr/c4x/UPSUD/42001S02/asset/smp1.csv",
               destfile="./smp1.csv")
}
 smp.c<-read.csv2("./smp1.csv")
 str(smp.c)
 
 #representation de la distribution d'une valeur aleatoire qualitative
 ## diagramme en batons 
 ###barplot(table())
 barplot(table(smp.c$prof))
 
 ##Camembert
 ###pie(table())
 pie(table(smp.c$prof))

 #  representation de la distribution d'une valeurs aleatoire quantitative continue
 ##  histogramme
 hist(smp.c$age, col="grey", main="",xlab="age")

 ## boxplot
 boxplot(smp.c$age,xlab="age")
 boxplot(smp.c$age~smp.c$rs,xlab="recherche de sensation",ylab="age")

 #  representation de la distribution de 2 valeurs aleatoires quantitatives continues
 ## diagramme cartesien
 plot(smp.c$age,smp.c$n.enfant)

 ## faire que les points se decollent les uns des autres
 plot(jitter(smp.c$age),jitter(smp.c$n.enfant))
 
 # evolution temporelle de la representation de la distribution d'une valeurs aleatoire quantitative continue
if(!file.exists("./hdrs.csv")){
      download.file("https://www.france-universite-numerique-mooc.fr/c4x/UPSUD/42001S02/asset/outils_hdrs.csv","./hdrs.csv")
}
 redat<- read.csv2("./hdrs.csv")
 str(redat) 
 
install.packages("gplots") # impotant pour utiliser la fonction "plotmeans"
 require("gplots")
plotmeans(redat$HDRS~redat$VISIT,gap=0,barcol="red") 

 
 # evolution de chaque sujet
 interaction.plot(redat$VISIT,redat$NUMERO,redat$HDRS,ity=1,legend=FALSE)

 ################ Multiple choice
 #1 
 taille<-c(1.77, 1.64, 1.79, 1.74, 1.73, 1.70, 1.70, 1.77, 1.65, 1.7)
hist(taille)
barplot(table(taille))
 
 #2

 2/3
 
 ###############################################################################
 ################################  chapitre 3 ##################################
 ########### Mesures de postion et de disperion:les principes ##################
 ###############################################################################
 
 #Mesures de position
 # Variables categorielles
 lister le pourcentage de toutes les observations(modalités) de la variable categrielle
 evaluee
 # variables quantitatives
 ##mediane ( intuitive et robuste)
 ##moyenne(simple a calculer, Barycentre, propriete"comptable")
 
 
 var = s^2 ► s=sqrt(var) 
 var=[(x1 - u)^2 + ... + [xn- u]^2]/n
 var=(1/n)*(x1+ ... +xn)^2  -((x1+ ... + xn)/n)^n
 
 
 ####################### Multiple choice
 #1
 taille<-c(1.71 , 1.70 , 1.65 , 1.54 , 1.70 , 1.63 , 1.81 , 400 , 1.81 , 1.64 )
median(taille)
mean(taille)

 #2
 mu<-1.7
 sigma<-0.1
 
 mu+sigma
 mu-sigma

 ###############################################################################
 ################################  chapitre 4 ##################################
 ########### Mesures de postion et de disperion:la protique   ##################
 ###############################################################################
 
 #visualiser les variables
 ## probleme de lisibilité
 summary(smp.c)

 #solution au ppb de lisibilités
install.packages("prettyR")
require(prettyR)
describe(smp.c)

#meilleure solution 
 describe(smp.c,num.desc=c("mean","sd","median","min","max","valid.n"))

 table(smp.c$prof,deparse.level=2,useNA="always")

 
 ###############################################################################
 ################################    lab  1   ##################################
 ########### Gestion de données,Data Frame, variables numeriques  ##############
 ##########################    et  categorielles    ############################
 ###############################################################################
 
 if(!file.exists("./smp2.csv")){
        download.file("https://www.france-universite-numerique-mooc.fr/c4x/UPSUD/42001S02/asset/smp2.csv","./smp2.csv")
}
 smp<-read.csv2("./smp2.csv")
