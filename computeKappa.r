library("irr")
setwd("C:/Users/sc/Dropbox/Papers/2015 - MillionShort/irr")

#real data values from 0 to 4
kappa4946   <-kappam.fleiss(t(read.csv2("4946.csv",sep=",",header=FALSE)))
alpha4946   <-kripp.alpha(matrix(t(read.csv2("4946.csv",sep=",",header=FALSE)),ncol=10))
icc4946     <-ICC(t(read.csv2("4946.csv",sep=",",header=FALSE)),missing=FALSE)

kappa4948<-kappam.fleiss(t(read.csv2("4948.csv",sep=",",header=FALSE)))
alpha4948<-kripp.alpha(matrix(t(read.csv2("4948.csv",sep=",",header=FALSE)),ncol=10))
icc4948     <-ICC(t(read.csv2("4948.csv",sep=",",header=FALSE)),missing=FALSE)

kappa4953<-kappam.fleiss(t(read.csv2("4953.csv",sep=",",header=FALSE)))
alpha4953<-kripp.alpha(matrix(t(read.csv2("4953.csv",sep=",",header=FALSE)),ncol=10))
icc4953     <-ICC(t(read.csv2("4953.csv",sep=",",header=FALSE)),missing=FALSE)

kappa4954<-kappam.fleiss(t(read.csv2("4954.csv",sep=",",header=FALSE)))
alpha4954<-kripp.alpha(matrix(t(read.csv2("4954.csv",sep=",",header=FALSE)),ncol=10))
icc4954     <-ICC(t(read.csv2("4954.csv",sep=",",header=FALSE)),missing=FALSE)

kappa4959<-kappam.fleiss(t(read.csv2("4959.csv",sep=",",header=FALSE)))
alpha4959<-kripp.alpha(matrix(t(read.csv2("4959.csv",sep=",",header=FALSE)),ncol=10))
icc4959     <-ICC(t(read.csv2("4959.csv",sep=",",header=FALSE)),missing=FALSE)

kappa4962<-kappam.fleiss(t(read.csv2("4962.csv",sep=",",header=FALSE)))
alpha4962<-kripp.alpha(matrix(t(read.csv2("4962.csv",sep=",",header=FALSE)),ncol=10))
icc4962     <-ICC(t(read.csv2("4962.csv",sep=",",header=FALSE)),missing=FALSE)

#shrinked values to binary values (0 or 1)

kappaBin4946<-kappam.fleiss(t(read.csv2("4946_binary.csv",sep=",",header=FALSE)))
alphaBin4946<-kripp.alpha(matrix(t(read.csv2("4946_binary.csv",sep=",",header=FALSE)),ncol=10))

kappaBin4948<-kappam.fleiss(t(read.csv2("4948_binary.csv",sep=",",header=FALSE)))
alphaBin4948<-kripp.alpha(matrix(t(read.csv2("4948_binary.csv",sep=",",header=FALSE)),ncol=10))

kappaBin4953<-kappam.fleiss(t(read.csv2("4953_binary.csv",sep=",",header=FALSE)))
alphaBin4953<-kripp.alpha(matrix(t(read.csv2("4953_binary.csv",sep=",",header=FALSE)),ncol=10))

kappaBin4954<-kappam.fleiss(t(read.csv2("4954_binary.csv",sep=",",header=FALSE)))
alphaBin4954<-kripp.alpha(matrix(t(read.csv2("4954_binary.csv",sep=",",header=FALSE)),ncol=10))

kappaBin4959<-kappam.fleiss(t(read.csv2("4959_binary.csv",sep=",",header=FALSE)))
alphaBin4959<-kripp.alpha(matrix(t(read.csv2("4959_binary.csv",sep=",",header=FALSE)),ncol=10))

kappaBin4962<-kappam.fleiss(t(read.csv2("4962_binary.csv",sep=",",header=FALSE)))
alphaBin4962<-kripp.alpha(matrix(t(read.csv2("4962_binary.csv",sep=",",header=FALSE)),ncol=10))

resultsMatrix<-matrix(c(
  kappa4946$raters,kappaBin4946$value,kappa4946$value,alphaBin4946$value,alpha4946$value,
  kappa4948$raters,kappaBin4948$value,kappa4948$value,alphaBin4948$value,alpha4948$value,
  kappa4953$raters,kappaBin4953$value,kappa4953$value,alphaBin4953$value,alpha4953$value,
  kappa4954$raters,kappaBin4954$value,kappa4954$value,alphaBin4954$value,alpha4954$value,
  kappa4959$raters,kappaBin4959$value,kappa4959$value,alphaBin4959$value,alpha4959$value,
  kappa4962$raters,kappaBin4962$value,kappa4962$value,alphaBin4962$value,alpha4962$value
  
),nrow=6,ncol=5,byrow=TRUE,dimnames = list(c("4946","4948","4953","4954","4959","4962"),c("n","kappaBin","kappa","alphaBin","alpha")))

# chose icc 1,1 because of https://de.wikipedia.org/wiki/Intra-Klassen-Korrelation
resultsMatrixShort<-matrix(c(
  kappa4946$raters,kappa4946$value,alpha4946$value,icc4946$results[2,2],
  kappa4948$raters,kappa4948$value,alpha4948$value,icc4948$results[2,2],
  kappa4953$raters,kappa4953$value,alpha4953$value,icc4953$results[2,2],
  kappa4954$raters,kappa4954$value,alpha4954$value,icc4954$results[2,2],
  kappa4959$raters,kappa4959$value,alpha4959$value,icc4959$results[2,2],
  kappa4962$raters,kappa4962$value,alpha4962$value,icc4962$results[2,2]
  
),nrow=6,ncol=4,byrow=TRUE,dimnames = list(c("4946","4948","4953","4954","4959","4962"),c("n","kappa","alpha","icc")))

write.csv(resultsMatrixShort,file="kappaResults.csv")