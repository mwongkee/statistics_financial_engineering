dat = read.csv("D:/statistics_data/datasets/Stock_bond.csv", header=TRUE)
dat
?read.csv
?dat
n = dim(dat)[1]
GMReturn = GM_AC[-1] / GM_AC[-n] - 1
names(dat)
GM_AC
attach(dat)
?names
?attach
GM_AC
?par
par(mfrow = c(1, 2))
?c
plot(GM_AC)
plot(F_AC)
n = dim(dat)[1]
n
GMReturn = GM_AC[-1] / GM_AC[-n] - 1
GMReturn
FReturn = F_AC[-1] / F_AC[-n] - 1
FReturn[:1]
FReturn[1]
FReturn[-1]
n
FReturn[-n]
FReturn[2]
FReturn[-2]
FReturn[n]
FReturn[-1]
FReturn[-2]
FReturn[-3]
FReturn[-4]
par(mfrow = c(1,1))
plot(GMReturn, FReturn)
GMLogReturn = log(GM_AC[-1] / GM_AC[-n])
FLogReturn = log(F_AC[-1] / F_AC[-n])
par(mfrow = c(1,1))
plot(GMLogReturn, FLogReturn)
?cor
cor(GMReturn, FReturn)
cor(GMLogReturn, FLogReturn)
compute_return <- function(stock) {
 n = dim(stock)[1]res = stock[-1] / stock[-n] - 1
compute_return <- function(stock) {
 n <- dim(stock)[1]
 res = stock[-1] / stock[-n] - 1
 return(res)
}
compute_return(MSFT)
compute_return(MSFT_AC)
compute_return <- function(stock) {
 n <- dim(stock)[0]
 return(res)
}
compute_return(MSFT_AC)
compute_return <- function(stock) {
 n <- dim(stock)[0]
 res = stock[-1] / stock[-n] - 1
}
compute_return(MSFT_AC)
dim(MSFT)
dim(MSFT_AC)
dim(MSFT_AC)[0]
MSFT_AC
?dim
type(MSFT_AC)
typeof(MSFT_AC)
length(MSFT_AC)
compute_return <- function(stock) {
 n <- length(stock)
 res = stock[-1] / stock[-n] - 1
}
compute_return <- function(stock) {
 n <- length(stock)
 res = stock[-1] / stock[-n] - 1
 return(res)
}
compute_return(MSFT_AC)
MSFTReturn = compute_return(MSFT_AC)
MRKReturn = compute_return(MRK_AC)
par(mfrow = c(1,1))
plot(MSFTReturn, FReturn)
cor(MSFTReturn, FReturn)
save.image("C:\\github_code\\statistics_financial_engineering\\ch2\\2_4_1")
