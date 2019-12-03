#' ---
#' title: "Class5"
#' output: github_docume nt
#' ---


#Class5 Data Visualization 
x <- rnorm(1000)

#fml
mean(x)
sd(x)

summary(x)
boxplot(x)
hist(x)
rug(x)
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
weight
plot(weight$Age, weight$Weight)
plot(weight$Age, weight$Weight, pch=15)
plot(weight$Age, weight$Weight, pch=15, cex=1.5)
plot(weight$Age, weight$Weight, lwd=2)
plot(weight$Age, weight$Weight, ylim=c(2,10))
plot(weight$Age, weight$Weight, xlab= "Age(months)")
plot(weight$Age, weight$Weight, ylab = "Weight(kg)")
plot(weight$Age, weight$Weight, main = "OwO")
plot(weight$Age, weight$Weight, xlab = "Age(months)", ylab = "Weight(kg)", main = "OwO", lwd = 2, col= "blue", pch=15, typ="o", cex=1.5)
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t", header = TRUE)
barplot(mouse$Count)
barplot(mouse$Count, horiz = TRUE, names.arg = mouse$Feature)
barplot(mouse$Count, horiz = TRUE, names.arg = mouse$Feature,)
read.delim("bimm143_05_rstats/weight_chart.txt")
par(mar=c(5,11,2,2))
barplot(mouse$Count, horiz = TRUE, names.arg = mouse$Feature, main="OwO", las=1)
OwO <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(OwO$Count, names.arg = OwO$Sample, col = rainbow(nrow(OwO)), las=2, ylab = "OwO")
barplot(OwO$Count, names.arg = OwO$Sample, col = c("blue2", "red2"), las=2, ylab = "OwO")
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
nrow(genes)
table(genes$State)
