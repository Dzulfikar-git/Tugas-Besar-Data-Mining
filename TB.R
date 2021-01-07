work_directory <- "C:/Users/User/Documents/Semester 3/DM/TB"
setwd(work_directory)
dataset <- read.csv("anan.csv", sep = ",")

library(C50)
library(printr)

dataset$age <- as.factor(dataset$age)
dataset$deliverynum <- as.factor(dataset$deliverynum)
dataset$deliverytime <- as.factor(dataset$deliverytime)
dataset$bloodofpressure <- as.factor(dataset$bloodofpressure)
dataset$heartproblem <- as.factor(dataset$heartproblem)
dataset$caesarian <- as.factor(dataset$caesarian)

model <- C5.0(caesarian ~., data=dataset)
model

summary(model)
plot(model)

datatesting <- dataset[1:5]

predictions <- predict(model, datatesting)
table(predictions, dataset$caesarian)
