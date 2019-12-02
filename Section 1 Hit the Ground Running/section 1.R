data <- read.csv(file.choose())

ggplot(data = data[data$carat < 2.5, ],
       aes(x=carat, y=price, color = clarity)) +
  geom_point()+
  geom_smooth()