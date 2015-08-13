setwd("C:/Users/sc/Dropbox/Papers/2015 - MillionShort/data")

result0k    <- read.csv2("results-0k.txt",sep="\t",header=FALSE,strip.white=TRUE)
result10k   <- read.csv2("results-10k.txt",sep="\t",header=FALSE,strip.white=TRUE)
result1000k <- read.csv2("results-1000k.txt",sep="\t",header=FALSE,strip.white=TRUE)


map5_0k <- subset(result0k, (result0k$V1=="P5" & result0k$V2 != "all"))[order(result0k$V2),]
map5_10k <- subset(result10k, result10k$V1=="P5" & result0k$V2 != "all")[order(result10k$V2),]
map5_1000k <- subset(result1000k, result1000k$V1=="P5" & result0k$V2 != "all")[order(result1000k$V2),]

map10_0k <- subset(result0k, (result0k$V1=="P10" & result0k$V2 != "all"))[order(result0k$V2),]
map10_10k <- subset(result10k, result10k$V1=="P10" & result0k$V2 != "all")[order(result10k$V2),]
map10_1000k <- subset(result1000k, result1000k$V1=="P10" & result0k$V2 != "all")[order(result1000k$V2),]

p5_0k <- subset(result0k, (result0k$V1=="P5" & result0k$V2 != "all"))[order(result0k$V2),]
p5_10k <- subset(result10k, result10k$V1=="P5" & result0k$V2 != "all")[order(result10k$V2),]
p5_1000k <- subset(result1000k, result1000k$V1=="P5" & result0k$V2 != "all")[order(result1000k$V2),]

p10_0k <- subset(result0k, (result0k$V1=="P10" & result0k$V2 != "all"))[order(result0k$V2),]
p10_10k <- subset(result10k, result10k$V1=="P10" & result0k$V2 != "all")[order(result10k$V2),]
p10_1000k <- subset(result1000k, result1000k$V1=="P10" & result0k$V2 != "all")[order(result1000k$V2),]

ndcg10_0k <- subset(result0k, (result0k$V1=="ndcg" & result0k$V2 != "all"))[order(result0k$V2),]
ndcg10_10k <- subset(result10k, result10k$V1=="ndcg" & result0k$V2 != "all")[order(result10k$V2),]
ndcg10_1000k <- subset(result1000k, result1000k$V1=="ndcg" & result0k$V2 != "all")[order(result1000k$V2),]

t.test(p10_0k$V3,p10_10k$V3,paired = TRUE)
t.test(p10_0k$V3,p10_1000k$V3,paired = TRUE)

t.test(ndcg10_0k$V3,ndcg10_10k$V3,paired = TRUE)
t.test(ndcg10_0k$V3,ndcg10_1000k$V3,paired = TRUE)

t.test(p5_0k$V3,p5_10k$V3,paired = TRUE)
t.test(p5_0k$V3,p5_1000k$V3,paired = TRUE)

t.test(map10_0k$V3,map10_10k$V3,paired = TRUE)
t.test(map10_0k$V3,map10_1000k$V3,paired = TRUE)

t.test(map5_0k$V3,map5_10k$V3,paired = TRUE)
t.test(map5_0k$V3,map5_1000k$V3,paired = TRUE)


