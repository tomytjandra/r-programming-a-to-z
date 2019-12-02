# IMPORT DATA
movies <- read.csv("Section6-Homework-Data.csv")
str(movies)

# SUBSETTING DATA
m <- movies[, c(3, 6, 8, 18)]
colnames(m) <- c("Genre", "Studio", "BudgetMillions", "GrossPercentage")

genre_plot <- c("action", "adventure", "animation", "comedy", "drama")
studio_plot <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
m <- m[m$Genre %in% genre_plot & m$Studio %in% studio_plot, ]

p <- ggplot(data = m, aes(x = Genre, y = GrossPercentage))

q <- p + 
  geom_jitter(aes(color = Studio, size = BudgetMillions)) +
  geom_boxplot(alpha = 0.7, outlier.color = NA, color = "red")

q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % By Genre") +
  theme(
    text = element_text(family = "Comic Sans MS"),
    
    # axes title
    axis.title = element_text(color = "blue", size = 20),
    
    # tick
    axis.text = element_text(size = 12),
    
    # title
    plot.title = element_text(color = "black", size = 20),
    
    # legend
    legend.title = element_text(size = 15),
    legend.text = element_text(size = 12)
  )

q$labels$size = "Budget $M"
q