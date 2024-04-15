# Anit-Hypertensive_study  

This is the Kruskal-Wallis test, Mann-Whitney U test, Paired T Test, and Shaprio Tests (to check normaility) on the PPR data for the Antihypertensive study.  

Performed in R (4.3.1)

Results

> # Name: Yash Patel
> 
> # Importing Dataset
> pprtests <- read.csv("PPR tests.csv", stringsAsFactors=TRUE, na.strings = c("Not Specified", "None"))
> class(pprtests) # Checking the class of the dataset
[1] "data.frame"
> 
> # Checking the first few rows to ensure that data is read in properly 
> head(pprtests)
                                                                                                                                                                                                                                 STUDY.NAME.OF.CLINICAL.TRIAL
1                                                                                                                                                                                                Renoprotection in Early Diabetic Nephropathy in Pima Indians
2                                                                                                                                                                                                       Carvedilol (25 mg) in 24 Fed, Healthy, Adult Subjects
3                                                                                                                                                                                                      Carvedilol 25 mg in 36 Fasted, Healthy, Adult Subjects
4 Effectiveness and Safety of Ramipril Alone Compared With Telmisartan Alone and in Combination With Ramipril in Patients at High Risk for Cardiovascular Events. Patients Intolerant to Ramipril Were Entered in TRANSCEND, Telmisartan Compared to Placebo.
5                                                                                                                                                                                                   Angiotensin II Blockade for Chronic Allograft Nephropathy
6                                                                                                                         Long-term Study of Nateglinide+Valsartan to Prevent or Delay Type II Diabetes Mellitus and Cardiovascular Complications (Navigator)
  PPR..CT.gov. PPR..Publication.
1         1.69              1.69
2         0.97                NA
3         1.03                NA
4         0.69              0.69
5         0.89              0.94
6         1.18              1.18
> 
> # Checking for normality
> shapiro.test(pprtests$PPR..Publication.) # This group is not normally distributed

	Shapiro-Wilk normality test

data:  pprtests$PPR..Publication.
W = 0.94541, p-value = 0.0001645

> qqnorm(pprtests$PPR..Publication.)
> qqline(pprtests$PPR..Publication.)
> 
> shapiro.test(pprtests$PPR..CT.gov.) # This group is not normally distributed

	Shapiro-Wilk normality test

data:  pprtests$PPR..CT.gov.
W = 0.9368, p-value = 7.499e-07

> qqnorm(pprtests$PPR..CT.gov.)
> qqline(pprtests$PPR..CT.gov.)
> 
> #kruskal test
> pprkruskal = kruskal.test(pprtests$PPR..CT.gov., pprtests$PPR..Publication.)
> pprkruskal

	Kruskal-Wallis rank sum test

data:  pprtests$PPR..CT.gov. and pprtests$PPR..Publication.
Kruskal-Wallis chi-squared = 102.84, df = 65, p-value = 0.001938

> 
> # Mann Whitney U test
> pprwilcox  = wilcox.test(pprtests$PPR..CT.gov., pprtests$PPR..Publication.)
> pprwilcox

	Wilcoxon rank sum test with continuity correction

data:  pprtests$PPR..CT.gov. and pprtests$PPR..Publication.
W = 9474, p-value = 0.7825
alternative hypothesis: true location shift is not equal to 0

> 
> # Paired T Test
> pprttest = t.test(pprtests$PPR..CT.gov., pprtests$PPR..Publication.,
+        alternative = c("two.sided", "less", "greater"),
+        mu = 0, paired = T, var.equal = FALSE,
+        conf.level = 0.95)
> pprttest

	Paired t-test

data:  pprtests$PPR..CT.gov. and pprtests$PPR..Publication.
t = -0.69613, df = 112, p-value = 0.4878
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
 -0.03369750  0.01617538
sample estimates:
mean difference 
   -0.008761062 

> 
> # Checking how many trials have the underrepressentation of women
> ctgov_underrepresentation = subset(pprtests, pprtests$PPR..CT.gov. < 0.8)
> percent_ctgov_underrepresentation = nrow(ctgov_underrepresentation)/nrow(pprtests)*100
> percent_ctgov_underrepresentation
[1] 14.36782
> 
> pub_underrepresentation = subset(pprtests, pprtests$PPR..Publication. < 0.8)
> percent_pub_underrepresentation = nrow(pub_underrepresentation)/nrow(pprtests)*100
> percent_pub_underrepresentation
[1] 8.62069
