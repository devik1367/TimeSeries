require(fpp) 

#load data
data(usmelec)

#plot data to analyze trends, seasonality, etc.
plot(usmelec)

#check whether the data is stationary or non-stationary
acf(usmelec)

#check if for variance, trends and/or seasonality
plot(stl(usmelec, s.window=12))

#stabilize variance
lambda = BoxCox.lambda(usmelec)
plot(BoxCox(usmelec, lambda))
elec <- BoxCox(usmelec, lambda)

#remove trends, seasonality
n <- ndiffs(elec)
plot(diff(elec, lag=n))
elec <- diff(elec, lag=n)

#check whether data is stationary now
acf(elec)
