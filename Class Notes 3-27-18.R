### Class Notes 3-27-2018

library(stringr)

## 1. Create a character string that contains just one quotation mark: "

print("DSO")
print("\"")

# R sees the \ as an indicator that the typist would like to escape the next character. Printing ("print\")
# yields the following

print("\"")
cat("\"")

cat("DSO\n545")
cat("DSO\t545")

## 2. Create the following in R:
## :-\
## (^_^")
## @_'-'
## \m/

cat(":-\\")
cat("(^_^\")")
cat("@_'-'")
cat("\\m/")


## 3. Load stringr R package, and search for str_locate() and str_sub().

?str_locate
?str_sub

## 4. Locate the character "a" in "great", "fantastic", and "super".

str_locate(string = "great", pattern = "a")
str_locate("fantastic", "a")
str_locate_all("fantastic", "a")

# str_locate_all gives you the location of where a particular letter is throughout the entire string

str_locate("super", "a")

str_locate(c("fantastic", "great", "super"), 
           pattern = "a")

## 5. Extract the substrings "tes", "ting", and "test", from "testing"

str_sub(string = "testing", start = 1,
        end = 3)
str_sub(string = "testing", start = 4,
        end = 7)
str_sub(string = "testing", start = 1,
        end = 4)

# for the second test, even if we use 8 as the last character, R will go to the end of the string and use that
# value as the last value. 

?str_extract


## 6. What do you think this code is doing?

input <- c("abc", "defg")
str_sub(input, c(2,3))

# the code appears to locate the letters that begin with position 2 from the first string and position 3
# from the second string. 

# If you don't specify, str_sub takes three arguments (where it starts at and where it ends). In the above
# example, we specify the start and not the end of the arguments. Therefore, it takes the start of the first
# string and then starts at the letter in position 3 from the third string and goes to the end of the string.
# this tells us that we can use str in a vector

## 7. Use str_locate() to identify the location of the blank line that separates the header from the body in
## the first e-mail (Hint: a blank line is a newline immediately followed by another newline)

email

email <- readRDS("email.rds")

email[1]
cat(email[1])

str_locate(email[1], pattern = "\n\n")
# this is saying that the \n\n is located at position 842 and 843 in the email. 

# this allows us to extract the header and save it in a variable. Let's do this for the first email

## 8. Extract the header of the first email message. 

header = str_sub(email[1], start = 1,
                     end = 842)
cat(header)        

# This tells us all of the information in the header. Now the body would be this:

body = str_sub(email[1], start = 843)
cat(body)

## 10. Extract the header and body for all email messages. Store the header and body in header and body
## variables respectively

breaks = str_locate(email, "\n\n")
library(dplyr)

# the output shows 200 elements that are the start and end of each email. 
# to get the headers we do the following:

headers = str_sub(email, end = breaks[,1])
bodies = str_sub(email, start = breaks[,2])

cat(bodies[6])
