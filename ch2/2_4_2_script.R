niter = 1e5
below = rep(0, niter)
set.seed(2009)
for (i in 1:niter)
{
  r = rnorm(45, mean = 0.05/253,
     sd = 0.23/sqrt(253))
  logPrice = log(1e6) + cumsum(r)
  minlogP = min(logPrice) # minimum price over next 45 days
  below[i] = as.numeric(minlogP < log(950000))
}
mean(below)

# 5. probability that it will ever be over 1,100,000

niter = 1e5
below = rep(0, niter)
set.seed(2009)
for (i in 1:niter)
{
  r = rnorm(100, mean = 0.05/253,
     sd = 0.23/sqrt(253))
  logPrice = log(1e6) + cumsum(r)
  maxlogP = max(logPrice) # max price over next 45 days
  below[i] = as.numeric(maxlogP > log(1100000))
}
mean(below)

# 6. probability of a loss.  Ever below 950,000 or ends below 

niter = 1e5
below = rep(0, niter)
set.seed(2009)
for (i in 1:niter)
{
  r = rnorm(100, mean = 0.05/253,
     sd = 0.23/sqrt(253))
  logPrice = log(1e6) + cumsum(r)
  minlogP = min(logPrice) # minimum price over next 45 days
  below[i] = as.numeric((minlogP > log(1100000)) | (logPrice[100] < log(1000000)))
}
mean(below)

# 7.1 expected profit
niter = 1e5
profit = rep(0, niter)
set.seed(2009)
for (i in 1:niter)
{
  r = rnorm(100, mean = 0.05/253,
     sd = 0.23/sqrt(253))
  logPrice = log(1e6) + cumsum(r)

  below95 = which(logPrice < log(950000))
  above110 = which(logPrice > log(1100000))
  everBelow95 = length(below95) > 0
  everAbove110 = length(above110) > 0

  if ((everBelow95) & (!everAbove110 | (below95[1] < above110[1]))) {
    profit[i] = exp(logPrice[below95[1]]) - 1000000
  } else if (everAbove110 > 0) {
    profit[i] = exp(logPrice[above110[1]]) - 1000000
  } else {
    profit[i] = exp(logPrice[100]) - 1000000
  }
}
mean(profit)


