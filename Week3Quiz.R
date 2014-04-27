# R Programming
# by Roger D. Peng, Brian Caffo, PhD, Jeff Leek
# 
# Week 3 Quiz

# Load datasets
library(datasets)    
data(iris)
?iris

# Question 1 There will be an object called 'iris' in your workspace. In this dataset, what
# is the mean of 'Sepal.Length' for the species virginica? (Please only enter
# the numeric result and nothing else.)

x <- iris                               #instantiate data
lapply(x,mean)                          #quick way to get mean of columns
sapply(x,mean)          

s <- split(x, x$Species)                #split rows of data by species(column 4)

lapply(s, function(x)                   #calculates the means of the splits
        colMeans(x[, c("Sepal.Length",  #use an inline "anonymous" function
                       "Sepal.Width", 
                       "Petal.Length", 
                       "Petal.Width")]))

# Question 2 Continuing with the 'iris' dataset from the previous Question, what R code
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width',
# 'Petal.Length', and 'Petal.Width'?

apply(iris[,1:4],2,mean)                #calculates the mean of columns (like above)

# Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)
?mtcars

# Question 3 How can one calculate the average miles per gallon (mpg) by number of
# cylinders in the car (cyl)?
y <- mtcars
with(mtcars,tapply(mpg,cyl,mean))

# Question 4 Continuing with the 'mtcars' dataset from the previous Question,
# what is the absolute difference between the average horsepower of 4-cylinder
# cars and the average horsepower of 8-cylinder cars?

horses<-with(mtcars,tapply(hp,cyl,mean))
horses[1] - horses[3]
abs(horses[1] - horses[3])

# Question 5
# If you run
# debug(ls)
# what happens when you next call the 'ls' function?
# 
# Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
