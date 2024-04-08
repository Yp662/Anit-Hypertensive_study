# Name: Yash Patel

# Importing Dataset
pprtests <- read.csv("PPR tests.csv", stringsAsFactors=TRUE, na.strings = "Not Specified")
class(pprtests) # Checking the class of the dataset

# Checking the first few rows to ensure that data is read in properly 
head(pprtests)

# Checking for normality
shapiro.test(as.numeric(pprtests$PPR..Publication.)) # This group is normally distributed
qqnorm(as.numeric(pprtests$PPR..Publication.))
qqline(as.numeric(pprtests$PPR..Publication.))

shapiro.test(as.numeric(pprtests$PPR..CT.gov.)) # This group is normally distributed
qqnorm(as.numeric(pprtests$PPR..CT.gov.))
qqline(as.numeric(pprtests$PPR..CT.gov.))

#kruskal test
pprkruskal = kruskal.test(as.numeric(pprtests$PPR..CT.gov.), as.numeric(pprtests$PPR..Publication.))
pprkruskal

# Mann Whitney U test
pprwilcox  = wilcox.test(as.numeric(pprtests$PPR..CT.gov.), as.numeric(pprtests$PPR..Publication.))
pprwilcox

# Paired T Test
pprttest = t.test(as.numeric(pprtests$PPR..CT.gov.), as.numeric(pprtests$PPR..Publication.),
       alternative = c("two.sided", "less", "greater"),
       mu = 0, paired = T, var.equal = FALSE,
       conf.level = 0.95)
pprttest
