# Import the dataset

dataset = read.csv("covid_data.csv")
View(dataset)

total = dataset[,3]
positive = dataset[,5]

data = data.frame(total, positive)
View(data)

# Library importing

library(caTools)

set.seed(123)

split = sample.split(data$positive, SplitRatio = 0.8)
View(split)

train = subset(data, split==TRUE)
test = subset(data, split == FALSE)

View(train)
View(test)

# Regression

regressor = lm(formula = positive~total, data = train)

# Prediction

y_pred = predict(regressor, newdata = test)

# Data comparision

output = data.frame(test$positive, y_pred)
View(output)


plot(test$total, test$positve, type = 'p', col = 'blue',xlab = "Total", ylab = "Positive")
lines(test$total,  y_pred, type = 'o', col = 'red')
