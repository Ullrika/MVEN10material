library(ggplot2)
library(dplyr)

df <- do.call('rbind',lapply(1:10^4,function(i){
x = rlnorm(200)
#x = rnorm(200)
#x = rexp(200)

data.frame(type=c("average","P95","max"), value=c(mean(x),
quantile(x,probs=0.95),max(x)))
}))


ggplot(df,aes(x=value, fill = type)) +
  geom_density(alpha = 0.5)

df %>%
  filter(type=="P95") %>%
  select(value) %>%
  qqnorm()  

