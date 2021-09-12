#author: Yaniv Bronshtein
#program Problem 21 All of Statistics Homework 1
set.seed(1)
#coin toss object
coin <- c('H', 'T')

#Default probabilities
p1_heads <- 0.3 
p2_heads <- 0.03

#Function to perform coin toss
coin_toss_experiment <- function(p, N=1000, title){
  proportion <- NULL
  for(i in 1:N){
    samp <- sample(coin, size = i, prob = c(p, 1-p), replace=TRUE)
    proportion <- c(proportion, sum(samp=='H')/i)
  }
  plot(x=1:N, y=proportion, main=title)
}
par(mfrow=c(2,2))
coin_toss_experiment(p1_heads, title='p=.3')
coin_toss_experiment(p2_heads, title='p=0.03')