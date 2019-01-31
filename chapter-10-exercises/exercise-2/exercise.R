# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <-  c(paste('Employee', c(1:100)))
employees


# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000

random <- c(runif(100, 40000,  50000)) 
# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.

salary_adj <-  c(runif(100, -5000, 10000))
# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

frame <- data.frame(employees, random, salary_adj,stringsAsFactors=FALSE )
# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).

frame$salaries18 <- frame$random + frame$salary_adj
# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)

frame$raise <- frame$salaries18 > frame$random

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
 x <-  frame[frame$employees == 'Employee 57', "salaries18"]

# How many employees got a raise?
sum(frame$raise == TRUE)

# What was the dollar value of the highest raise?
y <- frame[frame$salary_adj == max(frame$salary_adj), "salary_adj"]

# What was the "name" of the employee who received the highest raise?
z <-  frame[frame$salary_adj == max(frame$salary_adj), 'employees']

# What was the largest decrease in salaries between the two years?
q <- frame[frame$salary_adj == min(frame$salary_adj), "salary_adj"]



# What was the name of the employee who recieved largest decrease in salary?
b <-  frame[frame$salary_adj == min(frame$salary_adj), 'employees']

# What was the average salary change?
k <- mean(frame$salary_adj)

# For people who did not get a raise, how much money did they lose on average?

m <- frame[frame$raise == FALSE , ]
av <- mean(m$salary_adj)
## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(frame, 'data.csv')
