#setwd("C:/Users/sc/Dropbox/Papers/2015 - MillionShort")
setwd("/Users/schaer/Dropbox/Papers/2015 - MillionShort")

million0k<-read.csv2("./data/million-0k-clean-sort.txt",sep="\t",header=FALSE)
million10k<-read.csv2("./data/million-10k-clean-sort.txt",sep="\t",header=FALSE)
million1000k<-read.csv2("./data/million-1000k-clean-sort.txt",sep="\t",header=FALSE)

length(intersect(million0k$V3,million10k$V3))
length(intersect(million0k$V3,million1000k$V3))
length(intersect(million10k$V3,million1000k$V3))

cor.test(as.numeric(million0k$V3),as.numeric(million10k$V3), method="kendall")
for (i in 0:24) {
  kend <- (cor.test(as.numeric(million0k$V3[((i*10)+1):((i*10)+10)]),
           as.numeric(million10k$V3[((i*10)+1):((i*10)+10)]), 
           method="kendall"))
  print(kend$estimate[["tau"]])
}

cor.test(as.numeric(million0k$V3),as.numeric(million1000k$V3), method="kendall")
for (i in 0:24) {
  kend <- (cor.test(as.numeric(million0k$V3[((i*10)+1):((i*10)+10)]),
                    as.numeric(million1000k$V3[((i*10)+1):((i*10)+10)]), 
                    method="kendall"))
  print(kend$estimate[["tau"]])
}

cor.test(as.numeric(million10k$V3),as.numeric(million1000k$V3), method="kendall")
for (i in 0:24) {
  kend <- (cor.test(as.numeric(million10k$V3[((i*10)+1):((i*10)+10)]),
                    as.numeric(million1000k$V3[((i*10)+1):((i*10)+10)]), 
                    method="kendall"))
  print(kend$estimate[["tau"]])
}


