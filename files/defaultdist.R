library(ggplot2)
library(dplyr)

df <- do.call('rbind',lapply(1:10^4,function(i){
#x = rlnorm(200)
#x = rnorm(200)
x = rexp(200)

data.frame(type=c("average","P95","max"), value=c(mean(x),
quantile(x,probs=0.99),max(x)))
}))

df %>%
  #filter(type!="max") %>%
ggplot(aes(x=value, fill = type)) +
  geom_density(alpha = 0.5)

install.packages("sn")
library(sn)

hist(sn::rsn(10^4,0,1,1))
