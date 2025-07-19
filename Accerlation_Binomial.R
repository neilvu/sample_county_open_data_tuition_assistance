####### MoCo Tutition Assistance Project#######

###### TOPIC: Accerlation and Non-Accerlation Institution Compliance

#### Correlation on Institution Types and Accerlation Compliance 


########################### ENTRY NOTES ##########################

## a). Discussion: To provide proper funding, we need to ensure that the institutions are meeting the standards
## for applicants that will serve their needs and career goals in the county government and the mission. To do so,
## we would need to analyze baxed on their accerlation standards as set by the U.S. Department of Education 
## to ensure that they are keep on track with the education regulations. This will help us get a better 
## understanding about the institutions themselves and whether we can continue funding with them if they
## meet with our mission and goals.

#################################################################


######################### SET UP ############################

#activate tidyverse 
library(tidyverse)
#read in data 
accerlation <- read.csv("/Users/neilvu/Documents/MoCo Tuition Assistance/Tables/Topics/Accerleration/Accerlated_Classifcation_Institution.csv")
View(accerlation)

#########################################################



########################################## CLAIM #######################################

### NOTATION: Mu(2) > Mu(1)

### NULL (Mu 1) There is no difference between students who are likely to find their related 
### careers on accerlated PUBLIC and PRIVATE institutions.

### ALT (Mu 2) Students are more likely to find their related careers in their accerlated PUBLIC
### institutions than in other institutions whre they may or may NOT be approve.

######################################################################################



########################### Choosing Overall Groups of that Given Sample #########################

### a). Acccerlated PUBLIC Institutions (County and State)
treatment <- filter(accerlation, Institution_Classifcation == 'PUBLIC')
View(treatment) #32 obs
### b). Accerlated PRIVATE Institutions
control <- filter(accerlation, Institution_Classifcation == 'PRIVATE')
View(control) #25 obs.

#####################################################################


########################### Total Treatment and Control Sample Groups #########################

### a). Acccerlated PUBLIC Institutions (County and State)
Accer_Public <- sum(treatment$Accerlation == 'ACCERLATED')
View(Accer_Public) #32 obs 
### b). Accerlated PRIVATE Institutions
Accer_Private <- sum(control$Accerlation == 'ACCERLATED')
View(Accer_Private) #24 obs

#####################################################################




##################### Choose Tail and Perform Binomial Exact Test #############

#Choose tail and perform binomial exact test
#binom.test(Number of successes in the test group, total number in test group, successes in control
#(population)/total number tested, alternative = "less, greater [right tail] or leave off if 2 tailed")
## RIGHT TAIL: if the students are likely to favor with accerlated public institutions
## LEFT TAIL: if the


## formula binom.test(treatment(total), treatment(choosing), control(total)/control(choosing), one or two sided test) 

binom.test(32, 32, 24/25, alternative = "greater") #ONE SIDED!
# alternative - experiment (mu 2) is GREATER than the control (mu 1)
# experiment [numerator] 
#control [denonminal]


# Result of p-value?: 0.2708
# Use the binomal test to find out.
# Mu(2) "Alternative Hypothesis: true probability of success is greater than 0.96"


### Interpret: Based on the statistical methods using the Binonmial Therom, we can state that
### applicants who apply to PUBLIC accerlated institutions are more likely to have a broader
### career choice that will fit in their job careers than in accerlated private institutions.
### The p-value shows there is a certainity that we have credible evidence to state this fact
### in which we agreed on the experiment's claim. This will have an impact on the county's
### decision to continue funding for these tuition funding based on accerlation standards and
### institutions preferance.

### NOTE: Tax dollars are spent on public institutions so the county does give funding for 
### their fit and relvancy for their careers.




