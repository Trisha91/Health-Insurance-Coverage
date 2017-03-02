# ==========================================================================
# The original dataset has text fields where numeric or boolean are required
# ==========================================================================

# This script reads the csv file and does the conversion

raw_cols <- c("State",                                       
              "Uninsured.Rate..2010.",                       
              "Uninsured.Rate..2015.",                       
              "Uninsured.Rate.Change..2010.2015.",           
              "Health.Insurance.Coverage.Change..2010.2015.",
              "Employer.Health.Insurance.Coverage..2015.",   
              "Marketplace.Health.Insurance.Coverage..2016.",
              "Marketplace.Tax.Credits..2016.",              
              "Average.Monthly.Tax.Credit..2016.",           
              "State.Medicaid.Expansion..2016.",             
              "Medicaid.Enrollment..2013.",                  
              "Medicaid.Enrollment..2016.",                  
              "Medicaid.Enrollment.Change..2013.2016.",      
              "Medicare.Enrollment..2016.")


state_coverage <- read.csv(file="../input/states.csv", as.is=TRUE)

state_coverage$Uninsured.Rate..2010. <- as.numeric(sub("%","",state_coverage$Uninsured.Rate..2010.))/100
state_coverage$Uninsured.Rate..2015. <- as.numeric(sub("%","",state_coverage$Uninsured.Rate..2015.))/100
state_coverage$Uninsured.Rate.Change..2010.2015. <- state_coverage$Uninsured.Rate..2015. - state_coverage$Uninsured.Rate..2010.
state_coverage$Average.Monthly.Tax.Credit..2016. <- as.numeric(sub("\\$","",state_coverage$Average.Monthly.Tax.Credit..2016.))
state_coverage$State.Medicaid.Expansion..2016.   <- state_coverage$State.Medicaid.Expansion..2016. == "True"

str(state_coverage)
head(state_coverage)
